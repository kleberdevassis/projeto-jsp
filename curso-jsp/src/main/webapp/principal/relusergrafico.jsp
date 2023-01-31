<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- biblioteca de tags para a tecnologia JavaServer Pages -->

<!DOCTYPE html>
<html lang="en">


<jsp:include page="Head.jsp"></jsp:include>

<body>

	<jsp:include page="theme-loader.jsp"></jsp:include>

	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<!--oi-->

					<jsp:include page="navbarmainmenu.jsp"></jsp:include>


					<div class="pcoded-content">

						<jsp:include page="page-header.jsp"></jsp:include>


						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">

										<div class="row">

											<!-- indica que o elemento deve abranger uma largura total de 12 colunas em telas com pelo menos 576 pixels de largura -->
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-block">
														<h4 class="sub-title">Rel. Usuário</h4>


														<form class="form-material"
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															method="get" id="formUser">
															<input type="hidden" id="acaoRelatorioImprimirTipo"
																name="acao" value="imprimirRelatorioUser">
															<!-- acao foi definida em hidden porque deu erro pelo ContexPath -->

															<div class="form-row align-items-center">

																<div class="col-sm-3 my-1">
																	<label class="sr-only" for="dataInicial">Data
																		Inicial</label> <input value="${dataInicial}" ]type="text"
																		class="form-control" id="dataInicial"
																		name="dataInicial">
																</div>
																<div class="col-sm-3 my-1">
																	<label class="sr-only" for="dataFinal">Data
																		Final</label> <input value="${dataFinal}" type="text"
																		class="form-control" id="dataFinal" name="dataFinal">
																</div>

																<div class="col-auto my-1">
																	<button type="button" onclick="gerarGrafico()"
																		class="btn btn-primary ">Gerar Gráfico</button>


																</div>
															</div>

														</form>

														<div style="height: 500px; overflow: scroll;">

															<div>
																<canvas id="myChart"></canvas>
															</div>

														</div>



													</div>

												</div>
											</div>
										</div>
									</div>


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


	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<jsp:include page="javascriptfile.jsp"></jsp:include>

	<script type="text/javascript">

	
	function gerarGrafico(){
		
		var urlAction = document.getElementById('formUser').action;
		var dataInicial = document.getElementById('dataInicial').value;
		var dataFinal = document.getElementById('dataFinal').value;
		
		
		$.ajax({

			method : "get",
			url : urlAction,
			data : "dataInicial=" + dataInicial + '&dataFinal='+ dataFinal + '&acao=graficoSalario', <!-- passa o id do usuario e define a acao a ser executada na servlet -->
			success : function(response) {    <!--apos deletar os dados no banco, limpa o formulario e exibe a mensagem de conclusao -->

			var json = JSON.parse(response);
			
	
				var myChart = new Chart(
						document.getElementById('myChart'),
						{
							type : 'line',
							data : {
								labels: json.perfils,
								datasets:[{
									label:'Gráfico de média salarial por tip',
									backgroundColor: 'rgb(255, 99, 132)',
									borderColor: 'rgb(255, 99, 132)',
									data: json.salarios,
								}]
						       },
							options: {}
					}
						);
			}

		}).fail(
				function(xhr, status, errorThrown) {
					alert('Erro ao buscar dados para o grafico: '
							+ xhr.responseText);
				});
		
		
		
	}
	
		$(function() {

			$("#dataInicial")
					.datepicker(
							{
								dateFormat : 'dd/mm/yy',
								dayNames : [ 'Domingo', 'Segunda', 'Terça',
										'Quarta', 'Quinta', 'Sexta', 'Sábado' ],
								dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S',
										'S', 'D' ],
								dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sáb', 'Dom' ],
								monthNames : [ 'Janeiro', 'Fevereiro', 'Março',
										'Abril', 'Maio', 'Junho', 'Julho',
										'Agosto', 'Setembro', 'Outubro',
										'Novembro', 'Dezembro' ],
								monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
										'Mai', 'Jun', 'Jul', 'Ago', 'Set',
										'Out', 'Nov', 'Dez' ],
								nextText : 'Próximo',
								prevText : 'Anterior'
							});
		});

		$(function() {

			$("#dataFinal")
					.datepicker(
							{
								dateFormat : 'dd/mm/yy',
								dayNames : [ 'Domingo', 'Segunda', 'Terça',
										'Quarta', 'Quinta', 'Sexta', 'Sábado' ],
								dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S',
										'S', 'D' ],
								dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sáb', 'Dom' ],
								monthNames : [ 'Janeiro', 'Fevereiro', 'Março',
										'Abril', 'Maio', 'Junho', 'Julho',
										'Agosto', 'Setembro', 'Outubro',
										'Novembro', 'Dezembro' ],
								monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
										'Mai', 'Jun', 'Jul', 'Ago', 'Set',
										'Out', 'Nov', 'Dez' ],
								nextText : 'Próximo',
								prevText : 'Anterior'
							});
		});
	</script>

</body>

</html>
