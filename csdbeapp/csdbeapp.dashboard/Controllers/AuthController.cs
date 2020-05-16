using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using csdbeapp.dashboard.Models;
using csdbeapp.middle.Models;

namespace csdbeapp.dashboard.Controllers
{
    public class AuthController : Controller
    {

        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;

        public AuthController(SignInManager<IdentityUser> signInManager,UserManager<IdentityUser> userManager)
        {
            _signInManager = signInManager;
            _userManager = userManager;
        }
        public IActionResult Login()
        {
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> Login(LoginViewModel loginModel)
        {


            

            if (ModelState.IsValid)
            {
                // This doesn't count login failures towards account lockout
                // To enable password failures to trigger account lockout, set lockoutOnFailure: true
                var result = await _signInManager.PasswordSignInAsync(loginModel.Email, loginModel.Password, loginModel.RememberMe, lockoutOnFailure: true);

              
                if (result.Succeeded)
                {

                    return RedirectToAction("Success");
                }


                else
                {
                    ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                    return View();
                }
             
            }
            return View();
        }

        [Authorize]
        public IActionResult Success()
        {
            return View();
        }


        [Authorize]
        public IActionResult Logout()
        {
            _signInManager.SignOutAsync();
            return RedirectToAction("login");
        }

    }
}