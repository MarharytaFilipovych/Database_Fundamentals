using MySql.Data.MySqlClient;

    
var connectionString = "server=localhost;port=3306;database=hiking;uid=root;password=getready1415Leo12KF23Bu;";

        
using var connection = new MySqlConnection(connectionString); 
connection.Open();

var transaction = connection.BeginTransaction();
try
{
    
    UpdateUserEmail(connection, transaction, 1, "laptop@world.com");
    UpdateUserEmail(connection, transaction, 2, "ggggggworld");

    
    Console.WriteLine("Successful!");

    transaction.Commit();

}
catch (Exception e)
{
    transaction.Rollback();
    Console.WriteLine($"Rollback. Error: {e}!!!");
    
}

void UpdateUserEmail(MySqlConnection connection, MySqlTransaction transaction, int userId, string newEmail)
{
    
    
    var emailExistsCommand = new MySqlCommand("SELECT COUNT(*) FROM user WHERE email = @newEmail", connection, transaction);
    emailExistsCommand.Parameters.AddWithValue("@newEmail", newEmail); 
    var emailExists = Convert.ToInt32(emailExistsCommand.ExecuteScalar());
    if (emailExists > 0)
    {
        throw new Exception("Rollback: Email already exists in the database.");
    }
    var updateUserEmailCommand = new MySqlCommand("UPDATE user SET email = @new_email WHERE id = @user_id", connection, transaction);
    updateUserEmailCommand.Parameters.AddWithValue("@new_email", newEmail);
    updateUserEmailCommand.Parameters.AddWithValue("@user_id", userId);
    updateUserEmailCommand.ExecuteNonQuery();
    
    if (string.IsNullOrEmpty(newEmail))
    {
        throw new Exception("Rollback: New email is empty");
    }
    if (newEmail.Length > 50)
    {
        throw new Exception("Rollback: The length of the new email is too long (exceeds 50 symbols).");
    }
    if (!newEmail.Contains('@'))
    {
        throw new Exception("Rollback: There is no '@' in the email.");
    }

    var emailDomain = newEmail.Split('@')[1];
    var emailServerType = emailDomain.Split('.')[emailDomain.Split('.').Length - 1];
    

    if (emailServerType != "com")
    {
        throw new Exception("'Rollback: Invalid email server type. Email server type must be \".com\".");
    }

    
    
}


