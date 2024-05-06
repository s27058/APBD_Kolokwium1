using WebApplication1.Models;
using WebApplication1.Repositories;

namespace WebApplication1.Services;


public interface IPrescriptionService
{
    public IEnumerable<Prescription> GetPrescriptionListFromMedicamentId(int idMedicament);
}

public class PrescriptionService : IPrescriptionService
{
    private IMedicamentRepository _medicamentRepository;
    private IPrescription_MedicamentRepository _prescriptionMedicamentRepository;
    private IPrescriptionRepository _prescriptionRepository;

    public PrescriptionService(IMedicamentRepository medicamentRepository, IPrescription_MedicamentRepository prescriptionMedicamentRepository, IPrescriptionRepository prescriptionRepository)
    {
        _medicamentRepository = medicamentRepository;
        _prescriptionMedicamentRepository = prescriptionMedicamentRepository;
        _prescriptionRepository = prescriptionRepository;
    }

    public IEnumerable<Prescription> GetPrescriptionListFromMedicamentId(int idMedicament)
    {
        var ids = _prescriptionMedicamentRepository.GetAllPrescriptionIdsFromIdMedicament(idMedicament);
        var prescriptions = new List<Prescription>();
        foreach(var id in ids)
        {
            prescriptions.Add(_prescriptionRepository.GetPrescriptionFromId(id));
        }

        prescriptions.Sort((Prescription p1, Prescription p2) =>
        {
            if (p1.Date < p2.Date) return 1;
            return 0;
        });
        return prescriptions;
    }
}