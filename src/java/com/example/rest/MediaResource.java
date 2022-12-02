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
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import java.io.FileNotFoundException;
import java.util.List;
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
//        try {
//            //TODO 7 7 1.5
//        } catch (FileNotFoundException e) {
//        }
        return null;
    }
}
