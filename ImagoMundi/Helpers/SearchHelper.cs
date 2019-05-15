using ImagoMundi.Data;
using ImagoMundi.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Helpers
{
    public class SearchHelper<T> where T : ProductBase
    {
        private readonly DbSet<T> _dbSet;
        private readonly ApplicationDbContext _context;


        public SearchHelper(DbSet<T> dbSet, ApplicationDbContext context)
        {
            _dbSet = dbSet;
            _context = context;
        }

        // Converts a string to a string array
        private string[] ConvertToStringArray(string input)
        {
            string[] words = input.ToUpper().Split(" ");
            for(int i = 0; i < words.Length; i++)
            {
                words[i] = " " + words[i] + " ";
            }

            return words;
        }


        public List<SearchResult> SearchByDescription(string input)
        {
            List<SearchResult> resultProducts = new List<SearchResult>();
            string[] searchWords = ConvertToStringArray(input);
            var results = new List<ViewProduct>();
            IQueryable<ViewProduct> productsQuery;

            foreach (var searchWord in searchWords)
            {
                productsQuery = from product in _dbSet
                                join image in _context.Images on product.ImageId equals image.Id
                                where product.Keywords.Contains(searchWord)
                                select new ViewProduct
                                {
                                    SKU = product.SKU,
                                    Name = product.Name,
                                    Price = product.Price,
                                    ImageId = product.ImageId,
                                    Description = product.Description,
                                    Sales = product.Sales,
                                    ImagePath = image.Path
                                };
                results.AddRange(productsQuery.ToList());
            }
            var groupedResults = results.GroupBy(p => p.SKU).Select(p => p);

            foreach (var group in groupedResults)
            {
                if (group.Count() >= 1)
                    resultProducts.Add(new SearchResult() { Product = group.First(), Relevance = group.Count() });
            }
            return resultProducts;
        }
    }
}
