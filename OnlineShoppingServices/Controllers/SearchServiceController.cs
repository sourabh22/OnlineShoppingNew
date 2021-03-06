﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using OnlineShoppingServices.Models.DB;
using OnlineShoppingServices.Models;
using OnlineShoppingServices.Components;

namespace OnlineShoppingServices.Controllers
{
   //[Route("api/[controller]")]
    
              [Route("Search")]
              [ApiController]



    public class SearchServiceController : ControllerBase
    {
        SearchService service;
        OnlineShoppingDbContext context;
        public SearchServiceController(OnlineShoppingDbContext context)
        {
            this.context = context;
            service = new SearchService(this.context);
        }
        [ServiceErrorFilter]
        [Route("Category")]
        [HttpGet]
        public List<Category> GetCategories()
        {
           return service.GetCategories();
        }

        [HttpGet]
        [Route("SubCategory/{id}")]
        public List<Subcategory> GetSubCategories(int id)
        {
            try
            {
                return service.GetSubcategory(id);
            }
            catch(Exception e)
            {
               ContentResult result = new ContentResult() { Content=e.Message };
                return new List<Subcategory>();
            }
        }

        [HttpPost]
        [Route("GetProducts")]
        public IActionResult GetProducts(Subcategory subCategory)
        {
            var result = service.GetProducts(subCategory);

            //Controll will Redirect to SearchserviceService
            return Ok(result);
        }


        

    }
}