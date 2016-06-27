namespace NEO_natal.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Survey")]
    public partial class Survey
    {
        public int ID { get; set; }

        public int mothersId { get; set; }

        public int communityHealthWorkerID { get; set; }

        [Required]
        [StringLength(100)]
        public string address { get; set; }

        public int zip { get; set; }

        public int race { get; set; }

        public int firstChild { get; set; }

        public int prematureBirth { get; set; }

        public int visitObgyn { get; set; }

        public int age { get; set; }

        public int stress { get; set; }

        public int smoke { get; set; }

        public int familySmoke { get; set; }

        public int alcohol { get; set; }

        public int familyAlcohol { get; set; }

        public int drugs { get; set; }

        public int familyDrugs { get; set; }

        public int safeOwnHome { get; set; }

        public int safeNeighborhood { get; set; }

        public int chronicIllness { get; set; }

        public int transportation { get; set; }

        public int homeInternet { get; set; }

        public int mobileInternet { get; set; }

        public int diet { get; set; }

        public int govAssistance { get; set; }

        public int income { get; set; }

        public int education { get; set; }

        public virtual CommunityHealthWorker CommunityHealthWorker { get; set; }

        public virtual Mothers_Data Mothers_Data { get; set; }
    }
}
