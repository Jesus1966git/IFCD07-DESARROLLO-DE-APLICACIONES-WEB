/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.example.controller;

import com.example.bean.FileMediaBean;
import com.example.media.MediaItem;
import com.example.media.MediaManager;
import com.example.model.UploadData;
import jakarta.activation.MimetypesFileTypeMap;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Date;

/**
 *
 * @author Usr
 */
@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
@MultipartConfig(location = "/tmp")
public class UploadServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UploadServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        ServletContext context = getServletContext();
        String realPath = context.getRealPath("fxmedia");
        FileMediaBean fmm = new FileMediaBean(realPath);
        MediaManager mm = fmm.getMediaManager();
        String address = "/WEB-INF/error.jsp";
        Collection<Part> parts = request.getParts();
        if (parts.isEmpty()) {
            request.setAttribute("error", "Not a multipart/form-data request");
        } else {
            for (Part part : parts) {
                String name = part.getSubmittedFileName();
                try {
                    String contentType = new MimetypesFileTypeMap().getContentType(name);
                    if (contentType.startsWith("image") || contentType.startsWith("video")) {
                        int periodIndex = name.lastIndexOf(".");
                        String fileExtension = name.substring(periodIndex);
                        String title = name.substring(0, periodIndex);
                        MediaItem item = new MediaItem(title, name, new Date());
                        UploadData data = new UploadData(name, title, fileExtension);
                        request.setAttribute("uploadData", data);
                        address = "/WEB-INF/uploadData.jsp";
                        mm.createMediaItem(item, part.getInputStream());
                    } else {
                        request.setAttribute("error", contentType + " Not supported");
                    }
                    part.delete();
                } catch (IOException e) {
                    request.setAttribute("error", "Exception writing file: " + name + " : " + e);
                }
            }
        }
        RequestDispatcher dispatcher =request.getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
