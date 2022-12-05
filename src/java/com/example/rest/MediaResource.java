/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.rest;

import com.example.bean.FileMediaBean;
import com.example.media.MediaGroup;
import com.example.media.MediaItem;
import jakarta.annotation.PostConstruct;
import jakarta.servlet.ServletContext;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.WebApplicationException;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.Response.ResponseBuilder;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Path("media")
public class MediaResource {

    private static final Logger LOG = Logger.getLogger(MediaResource.class.getName());

    @Context
    private ServletContext context;
    private FileMediaBean fmm;

    @PostConstruct
    private void init() {
        String realPath = context.getRealPath("fxmedia");
        fmm = new FileMediaBean(realPath);
        fmm.loadData();

    }

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public MediaList getMedia() {
        MediaList mediaList = new MediaList();
        List<MediaGroup> groups = fmm.getGroups();
        for (MediaGroup group : groups) {
            for (MediaItem item : group.getItems()) {
                mediaList.mediaId.add(item.getId());
            }
        }
//        groups.forEach((MediaGroup mg) -> {
//            mg.getItems().stream().forEach(
//                    (MediaItem mi) ->  mediaList.mediaId.add(mi.getId()));
//        });
        return mediaList;
    }

    @GET
    @Path("{id}")
    @Produces({MediaType.APPLICATION_JSON})
    public MediaItem getMediaitem(@PathParam("id") String id) {
        MediaItem item = null;
        try {
            item = fmm.getMediaManager().getMediaItem(id);
            item.setUri("http://localhost:8086/WebMediaManager2/fxmedia/" + item.getId());
        } catch (FileNotFoundException e) {
            LOG.log(Level.SEVERE, "FileMediaManager did not find at MediaItem with Id: " + id, e);
            throw new WebApplicationException(Response.Status.NOT_FOUND);
        }
        return item;
    }

    @DELETE
    @Path("{id}")
    @Produces({MediaType.APPLICATION_JSON})
    public Response deleteMediaItem(@PathParam("id") String id) {
        ResponseBuilder responseBuilder;
        MediaItem item = null;
        try {
            fmm.getMediaManager().deleteMediaItem(id);
            responseBuilder = Response.ok("Deleted: " + id);
        } catch (FileNotFoundException e) {
              LOG.log(Level.SEVERE, "FileMediaManager did not find at MediaItem with Id: " + id, e);
              responseBuilder = Response.status(404, "NO HEMOS ENCONTRADO NADA CON ID: "+id);
        }
        return responseBuilder.build();
    }
    
    @PUT
    @Path("{fileName}")
    @Produces({MediaType.APPLICATION_JSON})
    public Response putMediaItem(@PathParam("fileName") String fileName, File file) {
        ResponseBuilder responseBuilder;
        int periodIndex = fileName.lastIndexOf(".");
        String title = fileName.substring(0, periodIndex);
        MediaItem item = new MediaItem(title, fileName, new Date());
        try {
            fmm.getMediaManager().createMediaItem(item, new FileInputStream(file));
              responseBuilder = Response.ok("Loaded: " + fileName);
        } catch (IOException ex) {
            Logger.getLogger(MediaResource.class.getName()).log(Level.SEVERE, null, ex);
            responseBuilder = Response.status(Response.Status.INTERNAL_SERVER_ERROR);
        }
        return responseBuilder.build();   
    }

}
