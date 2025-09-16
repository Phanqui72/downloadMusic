package data;

import java.io.*;

import business.User;

public class UserIO {

    public static void add(User user, String filepath) {
        try (PrintWriter out = new PrintWriter(new FileWriter(filepath, true))) {
            out.println(user.getEmail() + "|" + user.getFirstName() + "|" + user.getLastName());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static User getUser(String email, String filepath) {
        try (BufferedReader in = new BufferedReader(new FileReader(filepath))) {
            String line = in.readLine();
            while (line != null) {
                String[] parts = line.split("\\|");
                if (parts[0].equalsIgnoreCase(email)) {
                    String firstName = parts[1];
                    String lastName = parts[2];
                    return new User(email, firstName, lastName);
                }
                line = in.readLine();
            }
            return null;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}