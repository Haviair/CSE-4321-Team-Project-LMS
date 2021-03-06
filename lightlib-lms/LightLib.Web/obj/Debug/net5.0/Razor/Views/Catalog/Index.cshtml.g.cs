#pragma checksum "C:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Views\Catalog\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "b11b4d776509379d12431a14a0aa018fa2820284"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Catalog_Index), @"mvc.1.0.view", @"/Views/Catalog/Index.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Views\_ViewImports.cshtml"
using LightLib;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"b11b4d776509379d12431a14a0aa018fa2820284", @"/Views/Catalog/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"c7dcf4c2b8ef076cfc37705575b7fbcd613f6eaf", @"/Views/_ViewImports.cshtml")]
    public class Views_Catalog_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<LightLib.Web.Models.Catalog.AssetIndexModel>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Views\Catalog\Index.cshtml"
  
    ViewBag.Title = "Library Assets";

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
<h2 class=""lms-section-heading"">
    Library Assets 
</h2>

<div class=""row"">
    <section>
        <p>
            <strong>Assets</strong> make up the collection of all resources a library can loan across all branches.
        </p> 
        <p>
            Use this page to add, update, or remove Assets, see checkout queues, and mark items as lost or found.
        </p>
    </section>
</div>

<div class=""row"">
    <div class=""col-12"">
        <button class=""btn btn-primary btn-sm"">
            Add New Asset 
        </button>
    </div>
</div>

<hr />

<div class=""row"">
    <div class=""container container-fluid"">
        <nav aria-label=""Asset Table Navigation Top"">
          <ul class=""pagination justify-content-end"">
            <li class=""page-item small""><a class=""page-link"" href=""#"">Previous</a></li>
            <li class=""page-item small""><a class=""page-link"" href=""#"">Next</a></li>
          </ul>
        </nav>
        <table class=""table table-sm table-responsive-sm""");
            WriteLiteral(@">
            <thead class=""thead-dark"">
            <tr>
                <th scope=""col"">Id</th>
                <th scope=""col"">Title</th>
                <th scope=""col"">Status</th>
                <th scope=""col"">Location</th>
            </tr>
            </thead>
            <tbody>
");
#nullable restore
#line 49 "C:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Views\Catalog\Index.cshtml"
             foreach (var asset in Model.PageOfAssets.Results) {

#line default
#line hidden
#nullable disable
            WriteLiteral("                <tr>\r\n                    <th scope=\"row\">");
#nullable restore
#line 51 "C:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Views\Catalog\Index.cshtml"
                               Write(asset.Id);

#line default
#line hidden
#nullable disable
            WriteLiteral("</th>\r\n                    <td>");
#nullable restore
#line 52 "C:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Views\Catalog\Index.cshtml"
                   Write(asset.Title);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    <td>");
#nullable restore
#line 53 "C:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Views\Catalog\Index.cshtml"
                   Write(asset.Status.Name);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    <td>");
#nullable restore
#line 54 "C:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Views\Catalog\Index.cshtml"
                   Write(asset.Location.Name);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                </tr>\r\n");
#nullable restore
#line 56 "C:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Views\Catalog\Index.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral(@"            </tbody>
        </table>
        <nav aria-label=""Asset Table Navigation Bottom"">
          <ul class=""pagination justify-content-end"">
            <li class=""page-item small""><a class=""page-link"" href=""#"">Previous</a></li>
            <li class=""page-item small""><a class=""page-link"" href=""#"">Next</a></li>
          </ul>
        </nav>
    </div>
</div>


");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<LightLib.Web.Models.Catalog.AssetIndexModel> Html { get; private set; }
    }
}
#pragma warning restore 1591
