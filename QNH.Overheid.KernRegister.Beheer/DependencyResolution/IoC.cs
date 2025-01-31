// --------------------------------------------------------------------------------------------------------------------
// <copyright file="IoC.cs" company="Web Advanced">
// Copyright 2012 Web Advanced (www.webadvanced.com)
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// </copyright>
// --------------------------------------------------------------------------------------------------------------------


using System;
using System.Net.Http;
using System.Web.Http.Controllers;
using System.Web.Http.Dispatcher;

namespace QNH.Overheid.KernRegister.Beheer.DependencyResolution
{
    using System.Threading;
    using System.Threading.Tasks;
    using StructureMap;

    public static class IoC
    {
        public static IContainer Initialize()
        {
            return IocConfig.Container;
        }
    }

    public class StructureMapHttpControllerActivator : IHttpControllerActivator
    {
        private readonly IContainer container;

        public StructureMapHttpControllerActivator(IContainer container)
        {
            this.container = container;
        }

        public IHttpController Create(
                HttpRequestMessage request,
                HttpControllerDescriptor controllerDescriptor,
                Type controllerType)
        {
            try
            {
                return (IHttpController)this.container.GetInstance(controllerType);
            }
            catch (Exception ex)
            {
                return new ErrorController() { Exception = ex };
            }
        }

        private class ErrorController : IHttpController
        {
            public Exception Exception { private get; set; }

            public Task<HttpResponseMessage> ExecuteAsync(HttpControllerContext controllerContext, CancellationToken cancellationToken)
            {
                throw Exception ?? new Exception("Huh??");
            }
        }
    }
}