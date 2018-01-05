﻿using QNH.Overheid.KernRegister.Beheer.Properties;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Linq;
using System.Security.Principal;
using System.Web;
using NHibernate.Util;
using QNH.Overheid.KernRegister.Business.Service.Users;

namespace QNH.Overheid.KernRegister.Beheer.Utilities
{
    // TODO: setup authentication and rolemanagement other then windows
    public static class RoleManagement
    {
        //private static readonly Dictionary<ApplicationActions, StringCollection> RoleActionMapping = new Dictionary
        //    <ApplicationActions, StringCollection>
        //    {
        //        {ApplicationActions.ViewKvKData, Settings.Default.RoleView },
        //        {ApplicationActions.Admin, Settings.Default.AdministratorRole },
        //        {ApplicationActions.ManageKvKData, Settings.Default.RoleManage },
        //        {ApplicationActions.Crm, Settings.Default.CrmRole },
        //        {ApplicationActions.Brmo, Settings.Default.BrmoRole },
        //        {ApplicationActions.Crediteuren, Settings.Default.CrediteurenRole },
        //        {ApplicationActions.Debiteuren, Settings.Default.DebiteurenRole }
        //    };

        private static IUserManager UserManager => IocConfig.Container.GetInstance<IUserManager>();

        public static bool IsAllowedAllActions(this IPrincipal user, params ApplicationActions[] actions)
        {
            return UserManager.IsAllowedAllActions(user.Identity.Name, actions);
            //if (!System.Web.Security.Roles.Enabled)
            //{
            //    return true;
            //}
            //
            //var allowedActionMappings = RoleActionMapping.Where(ram => actions.Contains(ram.Key));
            //return allowedActionMappings.All(
            //        aa => aa.Value
            //            .OfType<string>()
            //            .Any(
            //                roleOrName =>
            //                    roleOrName == "*" || user.IsInRole(roleOrName) ||
            //                    user.Identity.Name.EndsWith(roleOrName, StringComparison.InvariantCultureIgnoreCase)));
        }

        public static bool IsAllowedAnyActions(this IPrincipal user, params ApplicationActions[] actions)
        {
            return UserManager.IsAllowedAnyActions(user.Identity.Name, actions);
            //if (!System.Web.Security.Roles.Enabled)
            //{
            //    return true;
            //}
            //
            //var allowedActions = RoleActionMapping.Where(ram => actions.Contains(ram.Key)).SelectMany(ram => ram.Value.OfType<string>());
            //return allowedActions.Any(roleOrName =>
            //        roleOrName == "*" || user.IsInRole(roleOrName) ||
            //        user.Identity.Name.EndsWith(roleOrName, StringComparison.InvariantCultureIgnoreCase));
        }
    }
}