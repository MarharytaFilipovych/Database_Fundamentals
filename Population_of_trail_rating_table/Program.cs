using MySql.Data.MySqlClient;
const string connectionString = "server=localhost;port=3306;database=hiking;uid=root;password=getready1415Leo12KF23Bu;";



using var connection = new MySqlConnection(connectionString);
connection.Open();
const string insertCommand = "INSERT INTO trail_rating (trail_id, user_id, score, difficulty_id) VALUES (@TrailId, @UserId, @Score, @DifficultyId)";
using var command = new MySqlCommand(insertCommand, connection);
for (var trailId = 1; trailId <= 96; trailId++) 
{
    for (var userId = 1; userId <= 150; userId++) 
    {
        var score = new Random().NextDouble() * 5;

        var difficultyId = new Random().Next(1, 6);

        command.Parameters.Clear();
        command.Parameters.AddWithValue("@TrailId", trailId);
        command.Parameters.AddWithValue("@UserId", userId);
        command.Parameters.AddWithValue("@Score", score);
        command.Parameters.AddWithValue("@DifficultyId", difficultyId);

        command.ExecuteNonQuery();
    }
} 
    
Console.WriteLine("Trail ratings populated successfully.");