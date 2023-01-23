<%@page import="model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- biblioteca de tags para a tecnologia JavaServer Pages -->


<!-- charset=UTF-8 resolveu o problema com os acentos -->
<!DOCTYPE html>
<html lang="en">


<jsp:include page="Head.jsp"></jsp:include>

<body>
	<!-- Pre-loader start -->

	<jsp:include page="theme-loader.jsp"></jsp:include>

	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">

					<jsp:include page="navbarmainmenu.jsp"></jsp:include>

					<div class="pcoded-content">
						<!-- Page-header start -->

						<jsp:include page="page-header.jsp"></jsp:include>

						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">

										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-block">
														<h4 class="sub-title">Cad. Usuário</h4>

														<!-- enctype necessário para fazer o upload de imagem-->
														<form class="form-material" enctype="multipart/form-data"
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															method="post" id="formUser">
                                                            
															<input type="hidden" name="acao" id="acao" value=""> 

															<div class="form-group form-default form-static-label">
																<input type="text" name="id" id="id"
																	class="form-control" readonly="readonly"
																	value="${modolLogin.id}"> <span
																	class="form-bar"></span> <label class="float-label">ID:</label>
															</div>

															<!-- upload de imagem-->
															<div class="form-group form-default input-group mb-4">
																<div class="input-group-prepend">
																	<c:if
																		test="${modolLogin.fotouser != '' && modolLogin.fotouser != null}">
																		<a
																			href="<%= request.getContextPath()%>/ServletUsuarioController?acao=downloadFoto&id=${modolLogin.id}">
																			<img alt="Imagem User" id="fotoembase64"
																			src="${modolLogin.fotouser}" width="70px">
																		</a>
																	</c:if>

																	<c:if
																		test="${modolLogin.fotouser == '' || modolLogin.fotouser == null}">
																		<img alt="Imagem User" id="fotoembase64"
																			src="assets/images/user.png" width="70px">
																	</c:if>

																</div>
																<input type="file" id="fileFoto" name="fileFoto"
																	accept="image/*"
																	onchange="visualizarImg('fotoembase64', 'fileFoto');"
																	class="form-control-file"
																	style="margin-top: 15px; margin-left: 5px;">
															</div>


															<div class="form-group form-default form-static-label">
																<input type="text" name="nome" id="nome"
																	class="form-control" required="required"
																	value="${modolLogin.nome}"> <span
																	class="form-bar"></span> <label class="float-label">Nome:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="text" name="dataNascimento" id="dataNascimento"
																	class="form-control" required="required"
																	value="${modolLogin.dataNascimento}"> <span
																	class="form-bar"></span> <label class="float-label">Dat. Nascimento:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="text" name="rendamensal" id="rendamensal"
																	class="form-control" required="required"
																	value="${modolLogin.rendamensal}"> <span
																	class="form-bar"></span> <label class="float-label">Renda Mensal</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="email" name="email" id="email"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.email}">
																<span class="form-bar"></span> <label
																	class="float-label">E-mail:</label>
															</div>


                                                            
															<div class="form-group form-default form-static-label">
																<select class="form-control"
																	aria-label="Default select example" name="perfil">
																	<option disabled="disabled">[Selecione o
																		Perfil]</option>


																	<option value="ADMIN"
																		<%ModelLogin modelLogin = (ModelLogin) request.getAttribute("modolLogin");

if (modelLogin != null && modelLogin.getPerfil().equals("ADMIN")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>Admin</option>

																	<option value="SECRETARIA"
																		<%modelLogin = (ModelLogin) request.getAttribute("modolLogin");

if (modelLogin != null && modelLogin.getPerfil().equals("SECRETARIA")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");

}%>>Secretária</option>

																	<option value="AUXILIAR"
																		<%modelLogin = (ModelLogin) request.getAttribute("modolLogin");

if (modelLogin != null && modelLogin.getPerfil().equals("AUXILIAR")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>Auxiliar</option>

																</select> <span class="form-bar"></span> <label
																	class="float-label">Perfil:</label>
															</div>


															<div class="form-group form-default form-static-label">
																<!-- onblur tem a (funcao) que traz os dados assim que se sai do campo de entrada apos a inclusao dos dados-->
																<input onblur="pesquisaCep();" type=text " name="cep"
																	id="cep" class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.cep}"> <span
																	class="form-bar"></span> <label class="float-label">Cep</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="logradouro" id="logradouro"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.logradouro}">
																<span class="form-bar"></span> <label
																	class="float-label">Logradouro</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="bairro" id="bairro"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.bairro}">
																<span class="form-bar"></span> <label
																	class="float-label">Bairro</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="localidade" id="localidade"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.localidade}">
																<span class="form-bar"></span> <label
																	class="float-label">Localidade</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="uf" id="uf"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.uf}"> <span
																	class="form-bar"></span> <label class="float-label">Estado</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="numero" id="numero"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.numero}">
																<span class="form-bar"></span> <label
																	class="float-label">Numero</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="login" id="login"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.login}">
																<span class="form-bar"></span> <label
																	class="float-label">Login</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="password" name="senha" id="senha"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.senha}">
																<span class="form-bar"></span> <label
																	class="float-label">Senha</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="radio" name="sexo" checked="checked"
																	value="MASCULINO"
																	<%modelLogin = (ModelLogin) request.getAttribute("modolLogin");

if (modelLogin != null && modelLogin.getSexo().equals("MASCULINO")) {
	out.print(" ");
	out.print("checked=\"checked\"");
	out.print(" ");
}%>>Masculino</>
																<input type="radio" name="sexo" value="FEMININO"
																	<%modelLogin = (ModelLogin) request.getAttribute("modolLogin");

if (modelLogin != null && modelLogin.getSexo().equals("FEMININO")) {
	out.print(" ");
	out.print("checked=\"checked\"");
	out.print(" ");
}%>>Feminino</>


															</div>



															<button type="button"
																class="btn btn-primary waves-effect waves-light"
																onclick="limparForm();">Novo</button>
																
															<button class="btn btn-success waves-effect waves-light">Salvar</button>
															
															<button type="button"
																class="btn btn-info waves-effect waves-light"
																onclick="criarDeleteComAjax();">Excluir</button>
																
															<!-- (condicao) se id do usuario estiver em tela, fazer a ancoragem do botao, com o link para servlet, 
																que automaticamente traz a tela telefone para o usuario -->
															<c:if test="${modolLogin.id > 0}">
																<a
																	href="<%= request.getContextPath() %>/ServletTelefone?iduser=${modolLogin.id}"
																	class="btn btn-primary waves-effect waves-light">Telefone</a>
															</c:if>
															<button type="button" class="btn btn-secondary"
																data-toggle="modal" data-target="#exampleModalUsuario">Pesquisar</button>
														</form>

													</div>
												</div>
											</div>
										</div>
										<span id="msg">${msg}</span>

										<div style="height: 300px; overflow: scroll;">
											<table class="table" id="tabelaresultadosview">
												<thead>
													<tr>
														<th scope="col">ID</th>
														<th scope="col">Nome</th>
														<th scope="col">Ver</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items='${modelLogins}' var='ml'>
														<tr>
															<td><c:out value="${ml.id}"></c:out></td>
															<td><c:out value="${ml.nome}"></c:out></td>
															<td><a class="btn btn-success"
																href="<%= request.getContextPath() %>/ServletUsuarioController?acao=buscarEditar&id=${ml.id}">Ver</a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>

										<nav aria-label="Page navigation example">
											<ul class="pagination">

												<!-- definindo o valor numerico da pagina em tela com bootstrap -->
												<%
												int totalPagina = (int) request.getAttribute("totalPagina");
												for (int p = 0; p < totalPagina; p++) {
													String url = request.getContextPath() + "/ServletUsuarioController?acao=paginar&pagina=" + (p * 5);
													out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + url + "\">" + (p + 1) + "</a></li>");
												}
												%>


											</ul>
										</nav>

									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="javascriptfile.jsp"></jsp:include>



	<!-- Modal -->
	<div class="modal fade" id="exampleModalUsuario" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Pesquisa de
						usuário</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Nome"
							aria-label="nome" id="nomeBusca" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-success" type="button"
								onclick="buscarUsuario();">Buscar</button>
						</div>
					</div>

					<div style="height: 300px; overflow: scroll;">
						<table class="table" id="tabelaresultados">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Nome</th>
									<th scope="col">Ver</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>

					<!--  html de paginacao do bootstrap a ser inclusa na pagina apos tratamento no ajax -->
					<nav aria-label="Page navigation example">
						<ul class="pagination" id="ulPaginacaoUserAjax">

						</ul>
					</nav>

					<!-- conteiner generico para ser exibido na tela apos devido tratamento no ajax-->
					<span id="totalResultados"></span>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>


    

	<script type="text/javascript">
	
	
	<!-- transforma valor numerico em valor monetário  -->
	$("#rendamensal").maskMoney({showSymbol:true, prefix:"R$ ", decimal:",", thousands:"."});

	<!-- constante formatter com numero formatado em moeda brasileira com fracao minima de dois digitos-->
	const formatter = new Intl.NumberFormat('pt-BR', {
	    currency : 'BRL',
	    minimumFractionDigits : 2
	});

	$("#rendamensal").val(formatter.format($("#rendamensal").val())); <!-- valor de rendamensal formatada como paremetro de constante formatter que esta definido como valor de rendamensal, o que formata o perfil do valor antes da digitacao -->

	$("#rendamensal").focus();

	var dataNascimento = $("#dataNascimento").val(); <!-- obtem o valor de dataNascimento -->

	var dateFormat = new Date(dataNascimento);

	$("#dataNascimento").val(dateFormat.toLocaleDateString('pt-BR',{timeZone: 'UTC'}));<!-- formata valor para o local UTC permitindo ser incluido no Banco-->

	$("#nome").focus();
	
	<!-- funcao para formatação da data de nascimento -->
	$( function() {
		  
		  $("#dataNascimento").datepicker({
			    dateFormat: 'dd/mm/yy',
			    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
			    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
			    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
			    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
			    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
			    nextText: 'Próximo',
			    prevText: 'Anterior'
			});
	} );
	
	
	  <!-- faz com que a campo na tela aceite apenas numeros -->
      $("#numero").keypress(function(event){
      return /\d/.test(String.fromCharCode(event.keyCode));
      });
      
       <!-- faz com que a campo na tela aceite apenas numeros -->
      $("#cep").keypress(function(event){
      return /\d/.test(String.fromCharCode(event.keyCode));
      });
	
	
	    <!-- funcao que adquire dados com o cep digitado, codigo consultado em https://viacep.com.br/exemplo/jquery/-->
		function pesquisaCep() {
			var cep = $("#cep").val();
            <!-- Consulta o webservice viacep.com.br-->
			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {

						if (!("erro" in dados)) {
							$("#cep").val(dados.cep);
							$("#logradouro").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#localidade").val(dados.localidade);
							$("#uf").val(dados.uf);
						}

					});
		}

		function visualizarImg(fotoembase64, filefoto) {

			var preview = document.getElementById(fotoembase64); // campo IMG html
			var fileUser = document.getElementById(filefoto).files[0];
			var reader = new FileReader();

			reader.onloadend = function() {
				preview.src = reader.result; /*Carrega a foto na tela*/
			};

			if (fileUser) {
				reader.readAsDataURL(fileUser); /*Preview da imagem*/
			} else {
				preview.src = '';
			}

		}

		function verEditar(id) {

			var urlAction = document.getElementById('formUser').action;

			window.location.href = urlAction + '?acao=buscarEditar&id=' + id;

		}

		function buscaUserPagAjax(url) {

			var urlAction = document.getElementById('formUser').action;
			var nomeBusca = document.getElementById('nomeBusca').value;

			$
					.ajax(
							{
								method : "get",
								url : urlAction,
								data : url,
								success : function(response, textStatus, xhr) {

									var json = JSON.parse(response);

									$('#tabelaresultados > tbody > tr')
											.remove();
									$("#ulPaginacaoUserAjax > li").remove();

									for (var p = 0; p < json.length; p++) {
										$('#tabelaresultados > tbody')
												.append(
														'<tr> <td>'
																+ json[p].id
																+ '</td> <td> '
																+ json[p].nome
																+ '</td> <td><button onclick="verEditar('
																+ json[p].id
																+ ')" type="button" class="btn btn-info">Ver</button></td></tr>');
									}

									document.getElementById('totalResultados').textContent = 'Resultados: '
											+ json.length;

									var totalPagina = xhr
											.getResponseHeader("totalPagina");

									for (var p = 0; p < totalPagina; p++) {

										var url = 'nomeBusca='
												+ nomeBusca
												+ '&acao=buscarUserAjaxPage&pagina='
												+ (p * 5);

										$("#ulPaginacaoUserAjax")
												.append(
														'<li class="page-item"><a class="page-link" href="#" onclick="buscaUserPagAjax(\''
																+ url
																+ '\')">'
																+ (p + 1)
																+ '</a></li>');

									}

								}

							}).fail(
							function(xhr, status, errorThrown) {
								alert('Erro ao buscar usuário por nome: '
										+ xhr.responseText);
							});

		}

		function buscarUsuario() {

			var nomeBusca = document.getElementById('nomeBusca').value; // traz o (valor do id nomeBusca) do botao Buscar

			if (nomeBusca != null && nomeBusca != '' && nomeBusca.trim() != '') { /*Validando que tem que ter valor pra buscar no banco*/

				var urlAction = document.getElementById('formUser').action; // traz o formUser que tem acesso a ServletUsuario e seus metodos

				$.ajax(
								{

									method : "get", // define o  método, que no caso é get.
									url : urlAction, // utiliza a variavel urlAction
									data : "nomeBusca=" + nomeBusca
											+ '&acao=buscarUserAjax',// cria um parametro nomeBusca com o valor da variavel nomeBusca e concatena com a acao buscarUserAjax que fica na ServletUsuario 
									success : function(response, textStatus,
											xhr) { // traz funcao com response txtStatus e xhr como parametro

										var json = JSON.parse(response); // variavel que transforma a resposta de dados obtidos em JSON

										$('#tabelaresultados > tbody > tr')
												.remove();// jquery removendo o que tiver no corpo da tabelaresultados
										$("#ulPaginacaoUserAjax > li").remove();// jquery removendo o que estiver na lista da paginacao

										for (var p = 0; p < json.length; p++) { // for que percorre o corpo da tabela de resultados e inclui os dados JSON
											$('#tabelaresultados > tbody')
													.append(
															'<tr> <td>'
																	+ json[p].id
																	+ '</td> <td> '
																	+ json[p].nome
																	+ '</td> <td><button onclick="verEditar('
																	+ json[p].id
																	+ ')" type="button" class="btn btn-info">Ver</button></td></tr>');
										}

										document
												.getElementById('totalResultados').textContent = 'Resultados: '
												+ json.length;// inclui no span totalResultados a informacao com o a quantidade que tem nos dados JSON

										var totalPagina = xhr // variavel que obtem o valor total da pagina atraves do atributo total pagina existente na servletUsuario
										.getResponseHeader("totalPagina");

										for (var p = 0; p < totalPagina; p++) {//for que inclui o nome digitado e ativa a acao na servletUsuario definindo a quantidade de 5  

											var url = 'nomeBusca=' // 
													+ nomeBusca
													+ '&acao=buscarUserAjaxPage&pagina='
													+ (p * 5);

											$("#ulPaginacaoUserAjax")
													// ainda dentro do laço inclui na ulPaginacaoUserAjax a funcao buscaUserPagAjax
													.append(
															'<li class="page-item"><a class="page-link" href="#" onclick="buscaUserPagAjax(\''
																	+ url
																	+ '\')">'
																	+ (p + 1)
																	+ '</a></li>');

										}

									}

								}).fail(
								function(xhr, status, errorThrown) {
									alert('Erro ao buscar usuário por nome: '
											+ xhr.responseText);
								});

			}

		}

		function criarDeleteComAjax() {

			if (confirm('Deseja realmente excluir os dados?')) {

				var urlAction = document.getElementById('formUser').action;
				var idUser = document.getElementById('id').value;

				$.ajax({

					method : "get",
					url : urlAction,
					data : "id=" + idUser + '&acao=deletarajax', <!-- passa o id do usuario e define a acao a ser executada na servlet -->
					success : function(response) {    <!--apos deletar os dados no banco, limpa o formulario e exibe a mensagem de conclusao -->

						limparForm();
						document.getElementById('msg').textContent = response;
					}

				}).fail(
						function(xhr, status, errorThrown) {
							alert('Erro ao deletar usuário por id: '
									+ xhr.responseText);
						});

			}

		}

		<!-- exibe frase de confirmação, acessa a servlet e aciona o get/acao/deletar para os dados serem deletados do banco  -->
		function criarDelete() {

			if (confirm('Deseja realmente excluir os dados?')) {

				document.getElementById("formUser").method = 'get';
				document.getElementById("acao").value = 'deletar';
				document.getElementById("formUser").submit();

			}

		}

		function limparForm() {

			var elementos = document.getElementById("formUser").elements; /*Retorna os elementos html dentro do form*/

			for (p = 0; p < elementos.length; p++) {
				elementos[p].value = '';
			}
		}
	</script>

</body>

</html>
