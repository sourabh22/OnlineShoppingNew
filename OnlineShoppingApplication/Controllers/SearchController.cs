using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using OnlineShoppingApplication.Models;
using OnlineShoppingLibrary;

namespace OnlineShoppingApplication.Controllers
{
    public class SearchController : Controller
    {
        SearchService service;
        public SearchController()
        {
            service = new SearchService();
        }

        public IActionResult Search()
        { 
            var result=service.Getcategories();
            SelectList list = new SelectList(result, "CategoryId", "CategoryName");
            ViewBag.categories = list;
            return View();
        }
    }
}



