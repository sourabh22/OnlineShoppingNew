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
        ProductserviceService service;
        [Route("PlaceOrder")]
        public IActionResult PlaceOrder(OrderFinalDetails details)
        {
            service = new ProductserviceService();
           int invoiceId= service.PlaceOrder(details);
            return Ok(invoiceId);
        }
    }
}