using MySql.Data.MySqlClient;


        const string connectionString = "server=localhost;port=3306;database=hiking;uid=root;password=getready1415Leo12KF23Bu;";

        using var connection = new MySqlConnection(connectionString);
        connection.Open();

        Console.WriteLine("Inserting a new record into trail...");
        InsertRecord(connection, "trail", ("name", "Green valley"), ("length", 20), ("elevation", 2000), ("description", "The green color swallows you"), ("image", "https://cdn.trailhub.com/green-valley-cover.jpg"), ("location_id", 15));

        Console.WriteLine("Inserting a new record into location...");
        InsertRecord(connection, "location", ("name", "Green"), ("country", "Ukraine"), ("region", "Lviv"), ("latitude", -53.7267), ("longitude", 127.8799));

        Console.WriteLine("Inserting a new record into trail_rating...");
        InsertRecord(connection, "trail_rating", ("trail_id", 35), ("user_id", 40), ("score", 0.1), ("difficulty_id", 5));

        Console.WriteLine("Inserting a new record into user...");
        InsertRecord(connection, "user", ("name", "Agata Spider"), ("email", "Agata@gmail.com"), ("user_password", "dtydytkyuryuk"), ("type", "noob"));

        Console.WriteLine("Inserting a new record into difficulty...");
        InsertRecord(connection, "difficulty", ("name", "very very difficult"), ("description", "You have never tried this"));

        Console.WriteLine("Inserting a new record into review...");
        InsertRecord(connection, "review", ("trail_id", 32), ("user_id", 41), ("title", "My first review"), ("content", "I will not return here"), ("review_date", DateTime.Parse("2000-05-18")));

        Console.WriteLine("Reading records...");
        ReadRecords(connection, "difficulty", "name");
        
        Console.WriteLine("Deleting...");
        DeleteRecords(connection, "difficulty", ("id", 6));

        
        Console.WriteLine("Updating...");
        UpdateRecords(connection, "difficulty", "name", "very very difficult", ("name", "slow") );

        connection.Close();
    
        
     void InsertRecord(MySqlConnection connection, string table, params (string column, object value)[] rows)
    {
        var command = connection.CreateCommand();
        var columns = "";
        var values = "";
        for (var i = 0; i < rows.Length; i++)
        {
            columns += rows[i].column;
            values += $"@{rows[i].column}";

            if (i < rows.Length - 1)
            {
                columns += ", ";
                values += ", ";
            }
        }
        command.CommandText = $"INSERT INTO {table} ({columns}) VALUES ({values})";
        foreach (var row in rows)
        {
            command.Parameters.AddWithValue($"@{row.column}", row.value);
        }

        command.ExecuteNonQuery();
    }
    

     void ReadRecords(MySqlConnection connection, string table, params string[] rows)
    {
        var command = connection.CreateCommand();
        var columns = string.Join(", ", rows);
        command.CommandText = $"SELECT {columns} FROM {table}";

        using var reader = command.ExecuteReader();
        while (reader.Read())
        {
            foreach (var row in rows)
            {
                Console.WriteLine($"{row}: {reader[row]}");
            }
        }
    }

     void DeleteRecords(MySqlConnection connection, string table, params (string column, object value)[] rows)
     {
         var command = connection.CreateCommand();
         var condition = "";
         for (var i = 0; i < rows.Length; i++)
         {
             condition += $"{rows[i].column} = @{rows[i].column}";

             if (i < rows.Length - 1) condition += " AND ";
             
         }
         
         command.CommandText = $"DELETE FROM {table} WHERE {condition}";
         foreach (var row in rows)
         {
             command.Parameters.AddWithValue($"@{row.column}", row.value);
         }
         command.ExecuteNonQuery();


     }

     void UpdateRecords(MySqlConnection connection, string table,
              string columnToUpdate, object valueToUpdate, params (string column, object value)[] newValues)
          {
              var command = connection.CreateCommand();
              var setCommand = "";
              for (var i = 0; i < newValues.Length; i++)
              {
                  var paramName = $"@{newValues[i].column}{i}"; // Generate unique parameter name
                  setCommand += $"{newValues[i].column} = {paramName}";
     
                  if (i < newValues.Length - 1) setCommand += ", ";
                  command.Parameters.AddWithValue(paramName, newValues[i].value); // Add parameter with unique name
              }
         
              command.CommandText = $"UPDATE {table} SET {setCommand} WHERE {columnToUpdate} = @columnToUpdate";
              command.Parameters.AddWithValue("@columnToUpdate", valueToUpdate);
         
              command.ExecuteNonQuery();
         
     }

     
