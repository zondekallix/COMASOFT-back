using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using COMASOFTbackend.Models;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace COMASOFTbackend.Models
{
    public partial class MaterialInsightContext : DbContext
    {
        public MaterialInsightContext()
        {
        }

        public MaterialInsightContext(DbContextOptions<MaterialInsightContext> options)
            : base(options)
        {
        }

        public virtual DbSet<CoefTypePropView> CoefTypePropView { get; set; }
        public virtual DbSet<CoefficientTypes> CoefficientTypes { get; set; }
        public virtual DbSet<Coefficients> Coefficients { get; set; }
        public virtual DbSet<IndexTables> IndexTables { get; set; }
        public virtual DbSet<MaterialData> MaterialData { get; set; }
        public virtual DbSet<MaterialMaterialComposite> MaterialMaterialComposite { get; set; }
        public virtual DbSet<MaterialTypes> MaterialTypes { get; set; }
        public virtual DbSet<Materials> Materials { get; set; }
        public virtual DbSet<PropertiesCoeffs> PropertiesCoeffs { get; set; }
        public virtual DbSet<SymmetryMaterials> SymmetryMaterials { get; set; }
        public virtual DbSet<MaterialDataTypSym> MaterialDataTypSym { get; set; } // dbset para el view de materiales, hecho a mano
        public virtual DbSet<AlgorithmInfo> AlgorithmInfo { get; set; }
        public virtual DbSet<MaterialTypesCoefficientTypes> MaterialTypesCoefficientTypes { get; set; }
        public virtual DbSet<IndexTableMaterialTcoefT> IndexTableMaterialTcoefT { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CoefTypePropView>(entity =>
            {
                entity.HasKey(e => e.IdCtype);

                //entity.ToView("CoefTypePropView");

                entity.Property(e => e.IdCtype);

                entity.Property(e => e.MeasureUnit);

                entity.Property(e => e.NameCtype);

                entity.Property(e => e.NameProperties);

                entity.Property(e => e.Prefix);

                entity.Property(e => e.IdProperties);

            });

            modelBuilder.Entity<CoefficientTypes>(entity =>
            {
                entity.HasKey(e => e.IdCtype);

                entity.Property(e => e.IdCtype).HasColumnName("IdCType");

                entity.Property(e => e.MeasureUnit)
                    .IsRequired()
                    .HasMaxLength(4000);

                entity.Property(e => e.NameCtype)
                    .IsRequired()
                    .HasColumnName("NameCType")
                    .HasMaxLength(4000);

                entity.Property(e => e.Prefix)
                    .IsRequired()
                    .HasMaxLength(4000);
            });

            modelBuilder.Entity<Coefficients>(entity =>
            {
                entity.HasKey(e => e.IdCoefficient);

                entity.Property(e => e.IdCtype).HasColumnName("IdCType");
            });

            modelBuilder.Entity<IndexTables>(entity =>
            {
                entity.HasKey(e => e.IdIndex);

                entity.Property(e => e.IdCtype).HasColumnName("IdCType");
            });

            modelBuilder.Entity<MaterialData>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("MaterialData");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(4000);

                entity.Property(e => e.MeasureUnit)
                    .IsRequired()
                    .HasMaxLength(4000);

                entity.Property(e => e.NameCtype)
                    .IsRequired()
                    .HasColumnName("NameCType")
                    .HasMaxLength(4000);

                entity.Property(e => e.NameMaterial)
                    .IsRequired()
                    .HasMaxLength(4000);

                entity.Property(e => e.NameMtype)
                    .IsRequired()
                    .HasColumnName("NameMType")
                    .HasMaxLength(4000);

                entity.Property(e => e.Prefix)
                    .IsRequired()
                    .HasMaxLength(4000);

                entity.Property(e => e.SymmetryName)
                    .IsRequired()
                    .HasMaxLength(4000);
            });

            modelBuilder.Entity<MaterialMaterialComposite>(entity =>
            {
                entity.HasKey(e => new { e.IdMaterial1, e.IdMaterial2 });

                entity.ToTable("Material_MaterialComposite");
            });

            modelBuilder.Entity<MaterialTypes>(entity =>
            {
                entity.HasKey(e => e.IdMtype);

                entity.Property(e => e.IdMtype).HasColumnName("IdMType");

                entity.Property(e => e.DescriptionMtype)
                    .IsRequired()
                    .HasColumnName("DescriptionMType")
                    .HasMaxLength(4000);

                entity.Property(e => e.NameMtype)
                    .IsRequired()
                    .HasColumnName("NameMType")
                    .HasMaxLength(4000);
            });

            modelBuilder.Entity<PropertiesCoeffs>(entity =>
            {
                entity.HasKey(e => e.IdProperties);

                entity.Property(e => e.NameProperties)
                    .IsRequired()
                    .HasMaxLength(4000);
            });

            modelBuilder.Entity<SymmetryMaterials>(entity =>
            {
                entity.HasKey(e => e.IdSymmetry);

                entity.Property(e => e.DescriptionSymmetry)
                    .IsRequired()
                    .HasMaxLength(4000);

                entity.Property(e => e.SymmetryName)
                    .IsRequired()
                    .HasMaxLength(4000);
            });

            modelBuilder.Entity<MaterialDataTypSym>(entity =>
            {
                entity.HasKey(e => e.IdMaterial);

                entity.Property(e => e.NameMaterial);

                entity.Property(e => e.NameMType);

                entity.Property(e => e.SymmetryName);

                entity.Property(e => e.IdMType);

                entity.Property(e => e.IdSymmetry);
            });

            modelBuilder.Entity<Materials>(entity =>
            {
                entity.HasKey(e => e.IdMaterial);

                entity.Property(e => e.CellGeometry).HasMaxLength(4000);

                entity.Property(e => e.Description).HasMaxLength(4000);

                entity.Property(e => e.IdMtype).HasColumnName("IdMType");

                entity.Property(e => e.NameMaterial)
                    .IsRequired()
                    .HasMaxLength(4000);

                entity.Property(e => e.SheerGeometry).HasMaxLength(4000);
            });

            
            modelBuilder.Entity<MaterialTypesCoefficientTypes>(entity =>
            {
                entity.HasKey(e => e.IdCm);

                entity.ToTable("MaterialTypes_CoefficientTypes");

                entity.Property(e => e.IdCm).HasColumnName("IdCM");

                entity.Property(e => e.IdCtype).HasColumnName("IdCType");

                entity.Property(e => e.IdMtype).HasColumnName("IdMType");
            });

            modelBuilder.Entity<IndexTableMaterialTcoefT>(entity =>
            {
                entity.HasKey(e => e.IdCm); entity.HasKey(e=> e.IdIndex) ;

                entity.ToView("IndexTableMaterialTCoefT");

                 entity.Property(e => e.IdCm).HasColumnName("IdCM");

                 entity.Property(e => e.IdCtype).HasColumnName("IdCType");

                 entity.Property(e => e.IdMtype).HasColumnName("IdMType");
            });

            modelBuilder.Entity<AlgorithmInfo>(entity =>
            {
                entity.HasKey(e => e.Idfile);

                entity.Property(e => e.Idfile).HasColumnName("idfile");

                entity.Property(e => e.Descripcion).HasColumnName("descripcion");

                entity.Property(e => e.IdMtype).HasColumnName("idMtype");

                entity.Property(e => e.Nombrefile).HasColumnName("nombrefile");

                entity.Property(e => e.Tipocompuesto)
                    .HasColumnName("tipocompuesto")
                    .HasMaxLength(50);

                entity.Property(e => e.Tipogeometria)
                    .HasColumnName("tipogeometria")
                    .HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);

        public DbSet<COMASOFTbackend.Models.MaterialDataTypSym> MaterialDataTypSym_1 { get; set; }
    }
}
