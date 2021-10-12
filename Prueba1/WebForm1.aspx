<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Prueba1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>Probando</p>

    <div class="panel panel-primary">
        <div class="panel-heading">
            Personal
        </div>
        <div class="panel-body">
            <div class="row form-group">
                <div class="row col-lg-12">
                    <div class="col-lg-2"> Rut </div>
                    <div class="col-lg-8">
                        <asp:TextBox CssClass="form-control" id="tx_rut" runat="server" ClientIDMode="Static" placeholder="Ej: 12.345.678-9" AutoComplete="off" onkeyup="ValFocusOut('tx_rut')" onblur="ValidarRut('tx_rut)"></asp:TextBox>
                    </div>
                </div>
                <div class="row col-lg-12">
                    <div class="col-lg-2"> Nombre </div>
                    <div class="col-lg-8">
                        <asp:TextBox class="form-control" type="text" id="tx_nombre"  runat="server" ClientIDMode="Static" onblur="ValFocusOut('tx_nombre')"></asp:TextBox>
                    </div>
                </div>
                <div class="row col-lg-12">
                    <div class="col-lg-2"> Direccion </div>
                    <div class="col-lg-8">
                        <asp:TextBox class="form-control" type="text" id="tx_direccion"  runat="server" ClientIDMode="Static" onblur="ValFocusOut('tx_direccion')"></asp:TextBox>
                    </div>
                </div>
                <div class="row col-lg-12">
                    <div class="col-lg-2"> Comuna </div>
                    <div class="col-lg-8">
                        <asp:DropDownList runat="server" ID="lstComunas" CssClass="form-control input-sm" ClientIDMode="Static" AutoPostBack="True"></asp:DropDownList>
                    </div>

                </div>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="btn-group">
            <asp:LinkButton ID="lkbContinuar" runat="server" CssClass="btn btn-success" OnClick="lkbContinuar_Click">Continuar</asp:LinkButton>
        </div>
    </div>

<%--    <div class="container">
        <div class="btn-group">
            <asp:Button ID="btnSubmit" class="btn-info" runat="server" Text="Submit"          
            OnClick="btnSubmit_Click"></asp:Button>
        </div>
    </div>--%>

    <!-- Bootstrap Modal Dialog -->
    <div class="modal fade" id="miModal" role="dialog" aria-labelledby="miModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><asp:Label ID="lblModalTitulo" runat="server" Text=""></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblModalDetalle" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <script>
        function ValFocusOut(Control) {
            var $icono = $('.position-icon i#Icon-' + Control);
            var SharpControl = "#" + Control;

            switch (SharpControl) {




                case "#tx_rut":
                    $(SharpControl).val($(SharpControl).val().replace(/[^\-kK0-9]/g, function (str) {
                        return '';
                    }));
                    $(SharpControl).val(formaterRut($(SharpControl).val()));

                    if (!ValidarRut($(SharpControl).val())) {

                        $(SharpControl).attr("style", "border-color:Red;");
                        $(SharpControl).attr("style", "background-color: #FFD6D6;");
                        $icono.removeClass("fa fa-check fa-color-ok");
                        $icono.addClass("fa fa-exclamation fa-color-error");
                        return false;

                    }
                    else {

                        $(SharpControl).attr("style", "border-color:Green;");
                        $(SharpControl).attr("style", "background-color: #F5F8F9;");
                        $icono.removeClass("fa fa-exclamation fa-color-error");
                        $icono.addClass("fa fa-check fa-color-ok");
                        return true;
                    }
                    break;

                case "#tx_nombre":
                    if (document.getElementById('tx_nombre').value.length == 0) {

                        $(SharpControl).attr("style", "border-color:Red;");
                        $(SharpControl).attr("style", "background-color: #FFD6D6;");
                        $icono.removeClass("fa fa-check fa-color-ok");
                        $icono.addClass("fa fa-exclamation fa-color-error");
                        return false;
                    }
                    else {
                        $(SharpControl).attr("style", "border-color:Green;");
                        $(SharpControl).attr("style", "background-color: #F5F8F9;");
                        $icono.removeClass("fa fa-exclamation fa-color-error");
                        $icono.addClass("fa fa-check fa-color-ok");
                        return true;
                    }
                    break;

                case "#tx_direccion":
                    if (document.getElementById('tx_direccion').value.length == 0) {

                        $(SharpControl).attr("style", "border-color:Red;");
                        $(SharpControl).attr("style", "background-color: #FFD6D6;");
                        $icono.removeClass("fa fa-check fa-color-ok");
                        $icono.addClass("fa fa-exclamation fa-color-error");
                        return false;

                    } else {
                        $(SharpControl).attr("style", "border-color:Green;");
                        $(SharpControl).attr("style", "background-color: #F5F8F9;");
                        $icono.removeClass("fa fa-exclamation fa-color-error");
                        $icono.addClass("fa fa-check fa-color-ok");
                        return true;
                    }
                    break;


                case "#TxtTelef":
                    SoloNumeros();
                    if (document.getElementById('TxtTelef').value.length == 9) {
                        $(SharpControl).attr("style", "border-color:Green;");
                        $(SharpControl).attr("style", "background-color: #F5F8F9;");
                        $icono.removeClass("fa fa-exclamation fa-color-error");
                        $icono.addClass("fa fa-check fa-color-ok");
                        return true;
                    }
                    else {
                        $(SharpControl).attr("style", "border-color:Red;");
                        $(SharpControl).attr("style", "background-color:#FFD6D6;");
                        $icono.removeClass("fa fa-check fa-color-ok");
                        $icono.addClass("fa fa-exclamation fa-color-error");
                        return false;
                    }
                    break;

                default:
            }
        };


        function validarut(elem) {
            var validado = true;
            var $th = $(elem);
            var $icono = $(elem).siblings('.position-icon').children();
            //$th.val($th.val().replace(/[^\-kK0-9]/g, function (str) {
            //    return '';
            //}));
            $th.val(formaterRut($th.val()));
            if (!ValidarRut($th.val()) || !validar_rut($th.val())) {
                $th.attr("style", "border-color:Red;");
                $th.attr("style", "background-color: #FFD6D6;");
                $icono.removeClass("fa fa-check fa-color-ok");
                $icono.addClass("fa fa-exclamation fa-color-error");
                validado = false;
            } else {
                $th.attr("style", "border-color:Green;");
                $th.attr("style", "background-color: #F5F8F9;");
                $icono.removeClass("fa fa-exclamation fa-color-error");
                $icono.addClass("fa fa-check fa-color-ok");
                validado = true;
            }
            return validado;
        }

        function ValidarRut(campo) {
            var $th = $(campo);
            var $icono = $(campo).siblings('.position-icon').children();

            if (campo.length == 0 || campo.length < 8) {
                $th.attr("style", "border-color:Red;");
                $th.attr("style", "background-color: #FFD6D6;");
                $icono.removeClass("fa fa-check fa-color-ok");
                $icono.addClass("fa fa-exclamation fa-color-error");
                return false;
            }

            campo = campo.replace('-', '')
            campo = campo.replace(/\./g, '')

            var suma = 0;
            var caracteres = "1234567890kK";
            var contador = 0;
            for (var i = 0; i < campo.length; i++) {
                u = campo.substring(i, i + 1);
                if (caracteres.indexOf(u) != -1)
                    contador++;
            }
            if (contador == 0) {
                $th.attr("style", "border-color:Red;");
                $th.attr("style", "background-color: #FFD6D6;");
                $icono.removeClass("fa fa-check fa-color-ok");
                $icono.addClass("fa fa-exclamation fa-color-error");
                return false
            }

            var rut = campo.substring(0, campo.length - 1)
            var drut = campo.substring(campo.length - 1)
            var dvr = '0';
            var mul = 2;

            for (i = rut.length - 1; i >= 0; i--) {
                suma = suma + rut.charAt(i) * mul
                if (mul == 7) mul = 2
                else mul++
            }
            res = suma % 11
            if (res == 1) dvr = 'k'
            else if (res == 0) dvr = '0'
            else {
                dvi = 11 - res
                dvr = dvi + ""
            }
            if (dvr != drut.toLowerCase()) {
                $th.attr("style", "border-color:Red;");
                $th.attr("style", "background-color: #FFD6D6;");
                $icono.removeClass("fa fa-check fa-color-ok");
                $icono.addClass("fa fa-exclamation fa-color-error");
                return false;
            }
            else {
                $th.attr("style", "border-color:Green;");
                $th.attr("style", "background-color: #F5F8F9;");
                $icono.removeClass("fa fa-exclamation fa-color-error");
                $icono.addClass("fa fa-check fa-color-ok");
                return true;
            }
        }

        function formaterRut(rut) {
            for (var i = 0; i < rut.length; i++)
                rut = rut.replace(".", "");

            if (rut.length == 0)
                return rut;
            rut = rut.replace("-", "");
            if (rut.indexOf("-") > -1)
                return rut;

            var Salida = rut.substr(0, rut.length - 1);
            var rutFormateadoPuntos = "";
            var dv = rut.substr(rut.length - 1);

            for (var i = 0; i < Salida.length; i++) {
                if ((i + 1) % 3 == 0 && (Salida.length - 1) != i) {
                    rutFormateadoPuntos = "." + Salida[(Salida.length - 1) - i] + rutFormateadoPuntos
                } else {
                    rutFormateadoPuntos = Salida[(Salida.length - 1) - i] + rutFormateadoPuntos
                }
            }
            return rutFormateadoPuntos + "-" + dv;
        }

        function validar_rut(r) {
            var t = "";
            if (r.length > 1) {
                if (crut = r,
                    largo = crut.length,
                    largo < 2)
                    return !1;
                for (i = 0; i < crut.length; i++)
                    " " != crut.charAt(i) && "." != crut.charAt(i) && "-" != crut.charAt(i) && (t += crut.charAt(i));
                if (rut = t,
                    crut = t,
                    largo = crut.length,
                    largo > 2 ? rut = crut.substring(0, largo - 1) : rut = crut.charAt(0),
                    dv = crut.charAt(largo - 1),
                    null == rut || null == dv)
                    return 0;
                var u = "0";
                for (suma = 0,
                    mul = 2,
                    i = rut.length - 1; i >= 0; i--)
                    suma += rut.charAt(i) * mul,
                        7 == mul ? mul = 2 : mul++;
                return res = suma % 11,
                    1 == res ? u = "k" : 0 == res ? u = "0" : (dvi = 11 - res, u = dvi + ""),
                    u == dv.toLowerCase()
            }
            return !1
        }

    </script>


</asp:Content>
