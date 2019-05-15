using ImagoMundi.Data;
using ImagoMundi.Models;
using Microsoft.EntityFrameworkCore;
using System;

namespace ImagoMundi.Helpers
{
    public static class EditHelper<T> where T : ModelBase
    {
        public static DateTime GetPresentDateTime()
        {
            return DateTime.UtcNow;
        }

        public static DateTime GetDateCreated(ApplicationDbContext _context, int id)
        {
            return GetEntity(_context, id).DateCreated;
        }

        public static Guid GetCreatedById(ApplicationDbContext _context, int id)
        {
            return GetEntity(_context, id).CreatedById;
        }

        private static T GetEntity(ApplicationDbContext _context, int id)
        {
            DbSet<T> _dbSet = _context.Set<T>();
            var entity = _dbSet.FindAsync(id).Result;
            _context.Entry(entity).State = EntityState.Detached;
            return entity;
        }
    }
}
