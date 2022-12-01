/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.model;

/**
 *
 * @author Usr
 */
public class UploadData {
    private final String fileName;
    private final String title;
    private final String extension;

    public UploadData(String fileName, String title, String extension) {
        this.fileName = fileName;
        this.title = title;
        this.extension = extension;
    }

    public String getFileName() {
        return fileName;
    }

    public String getTitle() {
        return title;
    }

    public String getExtension() {
        return extension;
    }
    
    
}
