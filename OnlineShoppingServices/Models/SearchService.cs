using OnlineShoppingServices.Models.DB;
using OnlineShoppingServices.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;



  namespace OnlineShoppingServices.Models
{
    public class SearchService
    {
        OnlineShoppingDbContext context;
        public SearchService(OnlineShoppingDbContext context)
        {
            this.context = context;
        }
        public List<Category> GetCategories()
        {
            var result = (from c in context.Category select c).ToList();
            return result;
        }

        public List<Subcategory> GetSubcategory(int id)
        {
            var result = (from sc in context.Subcategory where sc.CategoryId==id select sc).ToList();
            return result;
        }

        public List<Product>GetProducts(Subcategory subCategory )
        {
            Subcategory search = subCategory;
            var result = (from p in context.Product where p.CategoryId == search.CategoryId  && p.SubCategoryId==search.SubCategoryId select p).ToList();

            return result;
        }

        



        //public List<Product>ProcessOrder(ProductViewModelCart product )
        //{
        //     ProductViewModelCart search = product;

        //}
    }
}
