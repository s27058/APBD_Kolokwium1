namespace WebApplication1.Services;

public interface IPatientService
{
    public bool DeletePatientFromDatabase(int patientId);
}

public class PatientService : IPatientService
{
    public bool DeletePatientFromDatabase(int patientId)
    {
        return false;
    }
}