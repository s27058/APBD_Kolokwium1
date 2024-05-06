using WebApplication1.Models;
using System.Data.SqlClient;

namespace WebApplication1.Repositories;

public interface IMedicamentRepository
{
    public Medicament GetMedicamentFromId(int idMedicament);
}

public class MedicamentRepository : IMedicamentRepository
{
    private IConfiguration _configuration;
    public MedicamentRepository(IConfiguration configuration)
    {
        _configuration = configuration;
    }
    public Medicament GetMedicamentFromId(int idMedicament)
    {
        using var connection = new SqlConnection(_configuration["ConnectionStrings:DefaultConnection"]);
        connection.Open();

        using var command = new SqlCommand("SELECT IdMedicament, Name, Description, Type FROM MEDICAMENT WHERE IdMedicament = @IdMedicament");
        command.Parameters.AddWithValue("@IdMedicament", idMedicament);
        command.Connection = connection;

        using var reader = command.ExecuteReader();
        
        var medicament = new Medicament()
        {
            IdMedicament = (int)reader["IdMedicament"],
            Name = reader["Name"].ToString()!,
            Description = reader["Description"].ToString()!,
            Type = reader["Type"].ToString()!
        };

        return medicament;

    }
}