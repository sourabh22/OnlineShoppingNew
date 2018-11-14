using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineShoppingLibrary;
using OnlineShoppingServices.Models;

namespace OnlineShoppingServices.Controllers
{
    [Route("ProductOrder")]
    [ApiController]
    public class ProductServiceController : ControllerBase
    {
        ProductserviceController service;
        [Route("PlaceOrder")]
        public IActionResult PlaceOrder(OrderFinalDetails details)
        {
            service = new ProductserviceController();
           int invoiceId= service.PlaceOrder(details);
            return Ok(invoiceId);
        }
    }
}