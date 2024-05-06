using WebApplication1.Models;
using System.Data.SqlClient;

namespace WebApplication1.Repositories;

public interface IPrescriptionRepository
{
    public Prescription GetPrescriptionFromId(int idPrescription);
}

public class PrescriptionRepository : IPrescriptionRepository
{
    private IConfiguration _configuration;
    public PrescriptionRepository(IConfiguration configuration)
    {
        _configuration = configuration;
    }
    public Prescription GetPrescriptionFromId(int idPrescription)
    {
        using var connection = new SqlConnection(_configuration["ConnectionStrings:DefaultConnection"]);
        connection.Open();

        using var command = new SqlCommand("SELECT IdPrescription, Date, DueDate, IdPatient, IdDoctor FROM PRESCRIPTION WHERE IdPrescription = @IdPrescription");
        command.Parameters.AddWithValue("@IdPrescription", idPrescription);
        command.Connection = connection;

        using var reader = command.ExecuteReader();

        Prescription prescription = null;

        if (reader.Read())
        {
            prescription = new Prescription()
            {
                IdPrescription = (int)reader["IdPrescription"],
                Date = (DateTime) reader["Date"],
                DueDate = (DateTime) reader["DueDate"],
                IdPatient = (int)reader["IdPatient"],
                IdDoctor = (int)reader["IdDoctor"]
            };
        }


        return prescription;

    }
}