using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using OnlineShoppingLibrary;
using OnlineShoppingServices.Models.DB;
using OnlineShoppingServices.Models;

namespace OnlineShoppingServices.Controllers
{
    [Route("AdminService")]
    [ApiController]
    public class AdminServiceController : Controller
    {
        AdminService service;
        private string area;

        public AdminServiceController()
        {
            service = new AdminService();
        }

        [Route("SignUp")]
        [HttpPost]
        public IActionResult SignUp(Customer customer)
        {
            service = new AdminService();
            int result = service.SignUp(customer);
            return Ok(result);
        }

        
        [Route("Login")]
        [HttpPost]
        public IActionResult Authenticate(Credentials credentials)
        {
            int result = service.Authenticate(credentials);
            if (result == 0)
                return NotFound();
            else
             return Ok(result);
        }
      

    }
}