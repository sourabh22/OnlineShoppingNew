
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using OnlineShoppingApplication.Models;
using OnlineShoppingLibrary;
//using OnlineShoppingServices.Models;

using OnlineShoppingServices.Models.DB;
//using AdminService = OnlineShoppingServices.Models.AdminService;

namespace OnlineShoppingApplication.Controllers
{
    public class AdminController : Controller
    {
        AdminService service;

        ILogger<AdminController> logger;
        public AdminController(ILogger<AdminController> logger)
        {
            this.logger = logger;
            service = new AdminService();
        }
        public IActionResult Index()
        {
            return View();
        }

        //~~~~~~~~~~~~~~~~~~~~~~~~~~SIGN-UP~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        [ErrorFilter]
        public ActionResult Signup()
        {
            
            return View();
        }
         [HttpPost]
        public ActionResult Signup(Customer customer)
        {
          int result = service.SignUp(customer);
            if (result == 0)
            {
                ModelState.AddModelError("Email", "UserID already exist");
                logger.LogCritical("-----user Authentication failed--------");
                //  return  RedirectToAction("signup", "Admin", new { area = "" });
                return View("signup", customer);
            }
            else {
                
                return View("SignUpSuccess");
            }
            
        }

        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~LOG-IN~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
        public IActionResult Authenticate()
        {
            return View("Authenticate");
        }


        [HttpPost ]
        public ActionResult Authenticate(Credentials credentials)
        {
            try
            {

                int result = service.Authenticate(credentials);

                if (result == 0)
                {

                    ModelState.AddModelError("Email", "Invalid UserId or Password");
                    logger.LogCritical("-----user Authentication failed--------");
                    return View("Authenticate", credentials);
                   

                }
                else
                {
                    HttpContext.Session.SetString("cid", result.ToString());
                    logger.LogInformation("-----user Authentication Successful--------");
                    return RedirectToAction("Search", "Search", new { area = "" });
                }
            }
            catch (Exception e)
            {
                ErrorViewModel m = new ErrorViewModel();
                m.RequestId = e.Message;
                return View("Error", m);
            }
        }
    }
   

}