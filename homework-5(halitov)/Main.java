import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import com.github.javafaker.Faker;
import java.sql.*;

public class Main{
    public static void main(String[] args) {
        HikariConfig hikariConfig = new HikariConfig();
        hikariConfig.setJdbcUrl("jdbc:postgresql://localhost:5432/NewDB");
        hikariConfig.setUsername("postgres");
        hikariConfig.setPassword("Mqw333ert");
        HikariDataSource dataSource = new HikariDataSource(hikariConfig);
        //language=sql
        String SQL_INSERT = "insert into users(first_name, last_name, middle_name, phone_number, date_of_birth, profession, nationality) values (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = dataSource.getConnection()) {
            try (PreparedStatement statement = connection.prepareStatement(SQL_INSERT)) {
                Faker faker = new Faker();
                for (int i = 0; i < 1000; i++) {
                    statement.setString(1, faker.name().firstName());
                    statement.setString(2, faker.name().lastName());
                    statement.setString(3, faker.name().firstName());
                    statement.setString(4, faker.phoneNumber().cellPhone());
                    java.util.Date utilDate = faker.date().birthday();
                    statement.setDate(5, new java.sql.Date(utilDate.getTime()));
                    statement.setString(6, faker.job().position());
                    statement.setString(7, faker.nation().nationality());
                    statement.executeUpdate();
                }

            }
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        }
    }
}
