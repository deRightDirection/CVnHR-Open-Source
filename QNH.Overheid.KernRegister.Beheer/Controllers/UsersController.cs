﻿using QNH.Overheid.KernRegister.Business.Service.Users;
using System.Web.Mvc;
using QNH.Overheid.KernRegister.Beheer.Utilities;

namespace QNH.Overheid.KernRegister.Beheer.Controllers
{
    public class UsersController : Controller
    {
        private readonly IUserManager _userManager;

        public UsersController(IUserManager userManager)
        {
            _userManager = userManager;
        }

        //
        // GET: /Export/
        public ActionResult Index()
        {
            return View(_userManager.GetAllUserActions());
        }

        [HttpPost]
        public ActionResult AddUser(ApplicationActions action, string username)
        {
            if (!User.IsAllowedAllActions(ApplicationActions.CVnHR_Admin))
                return new HttpUnauthorizedResult("Only admin functionality!"); // ugly

            var result = _userManager.AddUserToAction(action, username);

            return Json(result);
        }

        public ActionResult RemoveUser(ApplicationActions action, string username)
        {
            if (!User.IsAllowedAllActions(ApplicationActions.CVnHR_Admin))
                return new HttpUnauthorizedResult("Only admin functionality!"); // ugly

            var result = _userManager.RemoveUserFromAction(action, username);

            return Json(result);
        }
    }
}
