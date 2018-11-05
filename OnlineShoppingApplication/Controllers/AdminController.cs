
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineShoppingApplication.Models;
using OnlineShoppingLibrary;
using OnlineShoppingServices.Models;

using OnlineShoppingServices.Models.DB;
using AdminService = OnlineShoppingServices.Models.AdminService;

namespace OnlineShoppingApplication.Controllers
{
    public class AdminController : Controller
    {

        AdminService service;
        public AdminController()
        {
            service = new AdminService();
        }
        public IActionResult Index()
        {
            return View();
        }
        [ErrorFilter]

        
        public ActionResult Signup()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Signup(Customer customer)
        {
           service.SignUp(customer);
            return View("SignUpSucecss");
        }
        
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

                    return View("Authenticate", credentials);


                }
                else
                {
                    HttpContext.Session.SetString("cid", result.ToString());

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