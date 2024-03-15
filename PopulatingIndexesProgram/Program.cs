using MySql.Data.MySqlClient;

class Program
{
    static void Main(string[] args)
    {
        const string connectionString =
            "server=localhost;port=3306;database=hiking;uid=root;password=getready1415Leo12KF23Bu;";
        var connection = new MySqlConnection(connectionString);

        try
        {
            connection.Open();

            var numberOfRecords = 5000;

            var query = "INSERT INTO trail_imaginary (name) VALUES (@name)";
            var command = new MySqlCommand(query, connection);
            command.Parameters.Add("@name", MySqlDbType.VarChar);

            for (var i = 0; i < numberOfRecords; i++)
            {
                var name = GenerateRandomName();

                command.Parameters["@name"].Value = name;

                command.ExecuteNonQuery();
            }

            Console.WriteLine("Data generated successfully.");
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error: " + ex.Message);
        }
        finally
        {
            connection.Close();
        }
    }

    static string[] natureElements =
    {
        "Oak", "Pine", "Cedar", "Birch", "Willow", "Bear", "Deer", "Eagle", "Wolf", "Waterfall", "Ridge", "Summit",
        "Valley", "Canyon", "Rain", "Snow", "Sunshine", "Storm", "Fog", "Forest", "Sun", "Ocean", "Sea", "River", "Lake", "Water", "Leaf"
    };

    static string[] geographicReferences =
    {
        "Mount", "Hills", "View", "North", "South", "East", "West", "Rocky Mountains", "Appalachian Trail",
        "Pacific Coast", "Waterfall"
    };

    static string[] adventureThemes =
        { "Explorer", "Expedition", "Quest", "Odyssey", "El Dorado", "Atlantis", "Shangri-La" };

    static string[] historicalReferences =
    {
        "Cherokee", "Apache", "Navajo", "Sioux", "Davy Crockett", "Daniel Boone", "Sacagawea", "Robin Hood",
        "King Arthur", "Paul Bunyan", "King", "Fight"
    };

    static string GenerateRandomName()
    {
        var rand = new Random();
        var element = natureElements[rand.Next(natureElements.Length)];
        var reference = geographicReferences[rand.Next(geographicReferences.Length)];
        var theme = adventureThemes[rand.Next(adventureThemes.Length)];
        var historical = historicalReferences[rand.Next(historicalReferences.Length)];
        var numbers = rand.Next(1, 10000);
        

        string[] options = { $"{element} {reference} {numbers}", $"{element} {numbers}", $"{historicalReferences} {numbers}", $"{theme} {element} {numbers}", $"{element} {historical} {numbers}" };
        return options[rand.Next(options.Length)];
    }
}



/*static double GenerateRandomLength()
{
    // Code to generate random trail lengths
    var random = new Random();
    return random.NextDouble() * 20 + 1; // Generate a random length between 1 and 20 km
}

static double GenerateRandomElevation()
{
    // Code to generate random trail elevations
    var random = new Random();
    return random.Next(100, 3000); // Generate a random elevation between 100 and 3000 meters
}

static string GenerateRandomDescription()
{
string[] descriptions = {
    "Enjoy scenic views of nature.",
    "Discover the beauty of the wilderness.",
    "Experience adventure in the great outdoors.",
    "Trek through ancient forests and uncover hidden secrets.",
    "Embark on a journey to discover forgotten trails and hidden waterfalls.",
    "Explore rugged terrain and experience the thrill of outdoor adventure.",
    "Witness breathtaking landscapes and capture memories that last a lifetime.",
    "Immerse yourself in the sights and sounds of untouched wilderness.",
    "Hike along winding paths and breathe in the fresh mountain air.",
    "Marvel at the beauty of towering peaks and pristine lakes.",
    "Escape the hustle and bustle of city life and reconnect with nature.",
    "Challenge yourself with steep climbs and rewarding summit views.",
    "Relax and unwind in serene natural surroundings.",
    "Get lost in the wonder of towering trees and lush vegetation.",
    "Embark on an epic journey through diverse landscapes and ecosystems.",
    "Feel the exhilaration of conquering rugged terrain and conquering new heights.",
    "Escape to remote wilderness areas and experience true solitude and tranquility.",
    "Discover hidden gems and secret spots off the beaten path.",
    "Forge your own path and create unforgettable memories along the way.",
    "Experience the thrill of outdoor adventure and the joy of exploration.",
    "Immerse yourself in the magic of nature and let your spirit soar."
};

var random = new Random();
return descriptions[random.Next(descriptions.Length)];
}

static string GenerateRandomImage()
{
string[] images = {
    "mountain.jpg", "forest.jpg", "river.jpg",
    "adventure.jpg", "explore.jpg", "discovery.jpg", "nature.jpg", "wilderness.jpg",
    "journey.jpg", "wanderlust.jpg", "scenic.jpg", "exploration.jpg", "outdoors.jpg",
    "adventurous.jpg", "serenity.jpg", "solitude.jpg", "majestic.jpg", "unspoiled.jpg",
    "hiking.jpg", "camping.jpg", "landscape.jpg", "trail.jpg", "summit.jpg", "waterfall.jpg",
    "sunset.jpg", "sunrise.jpg", "backpacking.jpg", "wildlife.jpg", "panorama.jpg",
    "vista.jpg", "reflection.jpg", "safari.jpg", "canyon.jpg", "ocean.jpg", "beach.jpg",
    "desert.jpg", "valley.jpg", "lake.jpg", "pond.jpg", "stream.jpg", "creek.jpg",
    "glacier.jpg", "cliff.jpg", "rock.jpg", "boulder.jpg", "forest-path.jpg", "bridge.jpg",
    "hut.jpg", "tent.jpg", "campfire.jpg", "stars.jpg", "moon.jpg", "clouds.jpg"
};

var random = new Random();
return images[random.Next(images.Length)];
}

}*/
