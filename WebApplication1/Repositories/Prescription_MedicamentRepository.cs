using WebApplication1.Models;
using System.Data.SqlClient;

namespace WebApplication1.Repositories;

public interface IPrescription_MedicamentRepository
{
    public IEnumerable<int> GetAllPrescriptionIdsFromIdMedicament(int idMedicament);
}

public class Prescription_MedicamentRepository : IPrescription_MedicamentRepository
{
    private IConfiguration _configuration;
    public Prescription_MedicamentRepository(IConfiguration configuration)
    {
        _configuration = configuration;
    }
    public IEnumerable<int> GetAllPrescriptionIdsFromIdMedicament(int idMedicament)
    {
        using var connection = new SqlConnection(_configuration["ConnectionStrings:DefaultConnection"]);
        connection.Open();

        using var command = new SqlCommand("SELECT IdPrescription FROM PRESCRIPTION_MEDICAMENT WHERE IdMedicament = @IdMedicament");
        command.Parameters.AddWithValue("@IdMedicament", idMedicament);
        command.Connection = connection;

        using var reader = command.ExecuteReader();

        var ids = new List<int>();

        while (reader.Read())
        {
            ids.Add((int)reader["IdPrescription"]);
        }

        return ids;

    }
}