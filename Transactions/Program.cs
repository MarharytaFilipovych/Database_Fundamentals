using System.Data;
using MySql.Data.MySqlClient;

    
var connectionString = "server=localhost;port=3306;database=hiking;uid=root;password=getready1415Leo12KF23Bu;";

        
using var connection = new MySqlConnection(connectionString); 
connection.Open();

var transaction = connection.BeginTransaction();
try
{
    UpdateUserEmail(connection, transaction, 1, "j@gamil.com");
    ChangeTrailDescription(connection, transaction, "", "");

    transaction.Commit();

}
catch (Exception e)
{
    transaction.Rollback();
    Console.WriteLine($"Rollback. Error: {e}");
    
}

void UpdateUserEmail(MySqlConnection connection, MySqlTransaction transaction, int userId, string newEmail)
{
    using (var command = new MySqlCommand("update_user_email", connection, transaction))
    {
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@user_id", userId);
        command.Parameters.AddWithValue("@new_email", newEmail);

        using (var reader = command.ExecuteReader())
        {
            while (reader.Read())
            {
                Console.WriteLine(reader["message"]);
            }
        }

    }
}

void ChangeTrailDescription(MySqlConnection connection, MySqlTransaction transaction, string trailName,
    string newDescription)
{
    using (var command = new MySqlCommand("change_trail_description", connection, transaction))
    {
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@trail_name", trailName);
        command.Parameters.AddWithValue("@new_description", newDescription);

        using (var reader = command.ExecuteReader())
        {
            while (reader.Read())
            {
                Console.WriteLine(reader["message"]);
            }
        }
    }
}