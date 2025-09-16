package controller;


import java.io.IOException;

import business.User;
import data.UserIO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.CookieUtil;

@WebServlet("/download")
public class DownloadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "viewAlbums"; // Set a default action
        }

        // 2. Perform action and set URL to the appropriate page
        String url = "/index.jsp";
        if (action.equals("viewAlbums")) {
            url = "/index.jsp";
        } else if (action.equals("checkUser")) {
            url = checkUser(request, response);
        }

        // 3. Forward the request to the view
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // Default URL
        String url = "/index.jsp";

        // Perform action and set URL to the appropriate page
        if (action.equals("registerUser")) {
            url = registerUser(request, response);
        }

        // Forward to the view
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    private String checkUser(HttpServletRequest request, HttpServletResponse response) {
        String productCode = request.getParameter("productCode");
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(20);
        session.setAttribute("productCode", productCode);
        User user = (User) session.getAttribute("user");

        String url;

        // If User object doesn't exist in session, check for the email cookie
        if (user == null) {
            Cookie[] cookies = request.getCookies();
            String emailAddress = CookieUtil.getCookieValue(cookies, "userEmail");

            // If the email cookie doesn't exist or is empty, go to the Registration page
            if (emailAddress == null || emailAddress.equals("")) {
                url = "/register.jsp";
            }
            // If cookie exists, create User object and go to the Downloads page
            else {
                ServletContext sc = getServletContext();
                String path = sc.getRealPath("/WEB-INF/EmailList.txt");
                user = UserIO.getUser(emailAddress, path);
                session.setAttribute("user", user);
                url = "/" + productCode + ".jsp";
            }
        }
        // If User object already exists in session, go directly to the Downloads page
        else {
            url = "/" + productCode + ".jsp";
        }
        return url;
    }

    private String registerUser(HttpServletRequest request, HttpServletResponse response) {
        // Get the user data from the request
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");

        // Store the data in a User object
        User user = new User();
        user.setEmail(email);
        user.setFirstName(firstName);
        user.setLastName(lastName);

        // Write the User object to a file
        ServletContext sc = getServletContext();
        String path = sc.getRealPath("/WEB-INF/EmailList.txt");
        UserIO.add(user, path);

        // Store the User object as a session attribute
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        //session.setMaxInactiveInterval(10);

        // Thay đổi tên cookie thành "userEmail" và thời gian sống thành 3 năm
        Cookie c = new Cookie("userEmail", email);
        c.setMaxAge(-1); // Bị hủy khi thoát web
        c.setPath("/");                      // Allow entire app to access it
        response.addCookie(c);

        // Create and return a URL for the appropriate Download page
        String productCode = (String) session.getAttribute("productCode");
        String url = "/" + productCode + ".jsp";
        return url;
    }
}

