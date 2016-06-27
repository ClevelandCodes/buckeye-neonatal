using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using NEO_natal.Models;

namespace NEO_natal.Controllers
{
    public class SurveyResultsController : Controller
    {
        private NEO_natalContext db = new NEO_natalContext();

        // GET: SurveyResults
        public ActionResult Index()
        {
            var surveys = db.Surveys.Include(s => s.CommunityHealthWorker).Include(s => s.Mothers_Data);
            return View(surveys.ToList());
        }

        // GET: SurveyResults/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Survey survey = db.Surveys.Find(id);
            if (survey == null)
            {
                return HttpNotFound();
            }
            return View(survey);
        }

        // GET: SurveyResults/Create
        public ActionResult Create()
        {
            ViewBag.communityHealthWorkerID = new SelectList(db.CommunityHealthWorkers, "communityHealthWorkerID", "loginName");
            ViewBag.mothersId = new SelectList(db.Mothers_Data, "mothersId", "firstName");
            return View();
        }

        // POST: SurveyResults/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,mothersId,communityHealthWorkerID,address,zip,race,firstChild,prematureBirth,visitObgyn,age,stress,smoke,familySmoke,alcohol,familyAlcohol,drugs,familyDrugs,safeOwnHome,safeNeighborhood,chronicIllness,transportation,homeInternet,mobileInternet,diet,govAssistance,income,education")] Survey survey)
        {
            if (ModelState.IsValid)
            {
                db.Surveys.Add(survey);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.communityHealthWorkerID = new SelectList(db.CommunityHealthWorkers, "communityHealthWorkerID", "loginName", survey.communityHealthWorkerID);
            ViewBag.mothersId = new SelectList(db.Mothers_Data, "mothersId", "firstName", survey.mothersId);
            return View(survey);
        }

        // GET: SurveyResults/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Survey survey = db.Surveys.Find(id);
            if (survey == null)
            {
                return HttpNotFound();
            }
            ViewBag.communityHealthWorkerID = new SelectList(db.CommunityHealthWorkers, "communityHealthWorkerID", "loginName", survey.communityHealthWorkerID);
            ViewBag.mothersId = new SelectList(db.Mothers_Data, "mothersId", "firstName", survey.mothersId);
            return View(survey);
        }

        // POST: SurveyResults/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,mothersId,communityHealthWorkerID,address,zip,race,firstChild,prematureBirth,visitObgyn,age,stress,smoke,familySmoke,alcohol,familyAlcohol,drugs,familyDrugs,safeOwnHome,safeNeighborhood,chronicIllness,transportation,homeInternet,mobileInternet,diet,govAssistance,income,education")] Survey survey)
        {
            if (ModelState.IsValid)
            {
                db.Entry(survey).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.communityHealthWorkerID = new SelectList(db.CommunityHealthWorkers, "communityHealthWorkerID", "loginName", survey.communityHealthWorkerID);
            ViewBag.mothersId = new SelectList(db.Mothers_Data, "mothersId", "firstName", survey.mothersId);
            return View(survey);
        }

        // GET: SurveyResults/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Survey survey = db.Surveys.Find(id);
            if (survey == null)
            {
                return HttpNotFound();
            }
            return View(survey);
        }

        // POST: SurveyResults/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Survey survey = db.Surveys.Find(id);
            db.Surveys.Remove(survey);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
