using Microsoft.AspNetCore.Mvc;
using WebApplication1.Services;

namespace WebApplication1.Controllers;

[ApiController]
[Route("/api/patients")]
public class PatientController : ControllerBase
{
    private IPatientService _patientService;

    public PatientController(IPatientService patientService)
    {
        _patientService = patientService;
    }

    [HttpDelete("{patientId : int}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public IActionResult DeletePatientFromDatabase([FromRoute] int patientId)
    {
        _patientService.DeletePatientFromDatabase(patientId);
        return NoContent();
    }
}