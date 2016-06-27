namespace NEO_natal.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class SurveyResults : DbContext
    {
        public SurveyResults()
            : base("name=SurveyResults")
        {
        }

        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<CommunityHealthWorker> CommunityHealthWorkers { get; set; }
        public virtual DbSet<Mothers_Data> Mothers_Data { get; set; }
        public virtual DbSet<Survey> Surveys { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AspNetRole>()
                .HasMany(e => e.AspNetUsers)
                .WithMany(e => e.AspNetRoles)
                .Map(m => m.ToTable("AspNetUserRoles").MapLeftKey("RoleId").MapRightKey("UserId"));

            modelBuilder.Entity<AspNetUser>()
                .HasMany(e => e.AspNetUserClaims)
                .WithRequired(e => e.AspNetUser)
                .HasForeignKey(e => e.UserId);

            modelBuilder.Entity<AspNetUser>()
                .HasMany(e => e.AspNetUserLogins)
                .WithRequired(e => e.AspNetUser)
                .HasForeignKey(e => e.UserId);

            modelBuilder.Entity<CommunityHealthWorker>()
                .Property(e => e.loginName)
                .IsUnicode(false);

            modelBuilder.Entity<CommunityHealthWorker>()
                .Property(e => e.passWord)
                .IsUnicode(false);

            modelBuilder.Entity<CommunityHealthWorker>()
                .Property(e => e.firstName)
                .IsUnicode(false);

            modelBuilder.Entity<CommunityHealthWorker>()
                .Property(e => e.lastName)
                .IsUnicode(false);

            modelBuilder.Entity<CommunityHealthWorker>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<CommunityHealthWorker>()
                .Property(e => e.jobTitle)
                .IsUnicode(false);

            modelBuilder.Entity<CommunityHealthWorker>()
                .Property(e => e.organization)
                .IsUnicode(false);

            modelBuilder.Entity<CommunityHealthWorker>()
                .HasMany(e => e.Mothers_Data)
                .WithRequired(e => e.CommunityHealthWorker)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CommunityHealthWorker>()
                .HasMany(e => e.Surveys)
                .WithRequired(e => e.CommunityHealthWorker)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Mothers_Data>()
                .Property(e => e.firstName)
                .IsUnicode(false);

            modelBuilder.Entity<Mothers_Data>()
                .Property(e => e.lastName)
                .IsUnicode(false);

            modelBuilder.Entity<Mothers_Data>()
                .Property(e => e.address)
                .IsUnicode(false);

            modelBuilder.Entity<Mothers_Data>()
                .Property(e => e.phone)
                .IsUnicode(false);

            modelBuilder.Entity<Mothers_Data>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<Mothers_Data>()
                .HasMany(e => e.Surveys)
                .WithRequired(e => e.Mothers_Data)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Survey>()
                .Property(e => e.address)
                .IsUnicode(false);
        }
    }
}
