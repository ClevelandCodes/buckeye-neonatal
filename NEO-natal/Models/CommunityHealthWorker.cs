namespace NEO_natal.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CommunityHealthWorker")]
    public partial class CommunityHealthWorker
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CommunityHealthWorker()
        {
            Mothers_Data = new HashSet<Mothers_Data>();
            Surveys = new HashSet<Survey>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int communityHealthWorkerID { get; set; }

        [Required]
        [StringLength(100)]
        public string loginName { get; set; }

        [Required]
        [StringLength(50)]
        public string passWord { get; set; }

        [Required]
        [StringLength(50)]
        public string firstName { get; set; }

        [Required]
        [StringLength(50)]
        public string lastName { get; set; }

        [Required]
        [StringLength(50)]
        public string email { get; set; }

        public int phone { get; set; }

        [Required]
        [StringLength(100)]
        public string jobTitle { get; set; }

        [Required]
        [StringLength(100)]
        public string organization { get; set; }

        [StringLength(128)]
        public string Id { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Mothers_Data> Mothers_Data { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Survey> Surveys { get; set; }
    }
}
