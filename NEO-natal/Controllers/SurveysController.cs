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
    public class SurveysController : Controller
    {
        private NEO_natalContext db = new NEO_natalContext();

        // GET: Surveys
        public ActionResult Index()
        {
            var surveys = db.Surveys.Include(s => s.CommunityHealthWorker).Include(s => s.Mothers_Data);
            return View(surveys.ToList());
        }

        // GET: Surveys/Details/5
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

        // GET: Surveys/RiskScore/5
        public ActionResult RiskScore(int? id)
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

        // GET: Surveys/Create
        public ActionResult Create()
        {
            ViewBag.communityHealthWorkerID = new SelectList(db.CommunityHealthWorkers, "communityHealthWorkerID", "loginName");
            ViewBag.mothersId = new SelectList(db.Mothers_Data, "mothersId", "firstName");
            return View();
        }

        // POST: Surveys/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,mothersId,communityHealthWorkerID,address,zip,race,firstChild,prematureBirth,visitObgyn,age,stress,smoke,familySmoke,alcohol,familyAlcohol,drugs,familyDrugs,safeOwnHome,safeNeighborhood,chronicIllness,transportation,homeInternet,mobileInternet,diet,govAssistance,income,education,riskScore")] Survey survey)
        {
            if (ModelState.IsValid)
            {

                //ENTER RISK SCORE HERE

                double riskScore = 0f;

                //QUESTION 1 WARD

                int zip = Convert.ToInt32(survey.zip);
                {
                    if (zip == 1)
                    {
                        riskScore += 53;
                    }
                    else if (zip == 2)
                    {
                        riskScore += 17;
                    }
                    else if (zip == 3)
                    {
                        riskScore += 18;
                    }
                    else if (zip == 4)
                    {
                        riskScore += 16;
                    }
                    else if (zip == 5)
                    {
                        riskScore += 37;
                    }
                    else if (zip == 6)
                    {
                        riskScore += 15;
                    }
                    else if (zip == 7)
                    {
                        riskScore += 19;
                    }
                    else if (zip == 8)
                    {
                        riskScore += 15;
                    }
                    else if (zip == 9)
                    {
                        riskScore += 33;
                    }
                    else if (zip == 10)
                    {
                        riskScore += 32;
                    }
                    else if (zip == 11)
                    {
                        riskScore += 20;
                    }
                    else if (zip == 12)
                    {
                        riskScore += 21;
                    }
                    else if (zip == 13)
                    {
                        riskScore += 16;
                    }
                    else if (zip == 14)
                    {
                        riskScore += 21;
                    }
                    else if (zip == 15)
                    {
                        riskScore += 38;
                    }
                    else if (zip == 16)
                    {
                        riskScore += 31;
                    }
                    else if (zip == 17)
                    {
                        riskScore += 10;
                    }

                    //QUESTION 2 - RACE 
                    int race = Convert.ToInt32(survey.race);

                    if (race == 1)
                    {
                        riskScore += 2;
                    }
                    else
                    {
                        riskScore += 0;
                    }

                    // QUESTION 3 - FIRST CHILD
                    int firstChild = Convert.ToInt32(survey.firstChild);

                    if (firstChild == 1)
                    {
                        riskScore += 5;
                    }
                    else
                    {
                        riskScore += 0;
                    }

                    // QUESTION 4 - PREMATURE BIRTH
                    int prematureBirth = Convert.ToInt32(survey.prematureBirth);

                    if (prematureBirth == 1)
                    {
                        riskScore += 5;
                    }
                    else
                    {
                        riskScore += 0;
                    }

                    //QUESTION 5 - VISIT OBGYN
                    int visitObgyn = Convert.ToInt32(survey.visitObgyn);     // no += 4.8, no or other += 0

                    if (visitObgyn == 2)
                    {
                        riskScore += 4.8f;
                    }
                    else
                    {
                        riskScore += 0f;
                    }

                   

                    //assign this to survey 
                    survey.riskScore = riskScore;

                    db.Surveys.Add(survey);
                    db.SaveChanges();
                    return RedirectToAction("Index");

                    }
                }

                ViewBag.communityHealthWorkerID = new SelectList(db.CommunityHealthWorkers, "communityHealthWorkerID", "loginName", survey.communityHealthWorkerID);
                ViewBag.mothersId = new SelectList(db.Mothers_Data, "mothersId", "firstName", survey.mothersId);
                return View(survey);
            }

        

        // GET: Surveys/Edit/5
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

        // POST: Surveys/Edit/5
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

        // GET: Surveys/Delete/5
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

        // POST: Surveys/Delete/5
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
