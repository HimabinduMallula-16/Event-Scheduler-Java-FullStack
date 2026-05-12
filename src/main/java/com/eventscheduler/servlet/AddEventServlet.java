package com.eventscheduler.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventscheduler.util.DBConnection;

@WebServlet("/addEvent")

public class AddEventServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        String title =
                request.getParameter("title");

        String description =
                request.getParameter("description");

        String date =
                request.getParameter("event_date");

        String time =
                request.getParameter("event_time");

        String status =
                request.getParameter("status");

        String priority =
                request.getParameter("priority");

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "INSERT INTO events(title,description,event_date,event_time,status,priority) VALUES(?,?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, title);
            ps.setString(2, description);
            ps.setString(3, date);
            ps.setString(4, time);
            ps.setString(5, status);
            ps.setString(6, priority);

            int rows =
                    ps.executeUpdate();

            if(rows > 0){

                response.sendRedirect(
                        "viewEvents.jsp");
            }

            else{

                response.getWriter()
                        .println("Event Not Added");
            }

        }

        catch(Exception e) {

            e.printStackTrace();

            response.getWriter()
                    .println(e);
        }
    }
}