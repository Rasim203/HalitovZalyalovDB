package ru.itis.kpfu;


import net.datafaker.Faker;

import java.sql.*;

public class Main {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/postgres";
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "postgres";
    //language=sql
    private static final String SQL_INSERT_VISITOR = "insert into visitors(first_name, last_name, patronymic," +
            " phone_number, birth_date, profession, nationality, email)" +
            " values (?, ?, ?, ?, ?, ?, ?, ?)";

    public static void main(String[] args) {
        Faker faker = new Faker();
        try (Connection connection = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(SQL_INSERT_VISITOR)) {
            for (int i = 0; i < 1000; i++) {
                statement.setString(1, faker.name().firstName());
                statement.setString(2, faker.name().lastName());
                statement.setString(3, faker.name().firstName());
                statement.setString(4, faker.phoneNumber().subscriberNumber(11));
                java.util.Date birthdayUtilDate = faker.date().birthday();
                java.sql.Date birthdaySqlDate = new java.sql.Date(birthdayUtilDate.getTime());
                statement.setDate(5, birthdaySqlDate);
                statement.setString(6, faker.job().position());
                statement.setString(7, faker.nation().nationality());
                statement.setString(8, faker.internet().emailAddress());
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
