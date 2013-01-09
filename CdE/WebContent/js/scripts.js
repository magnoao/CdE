var verify = 'y';

function set(arg) {
	verify = arg;
}

function checkForm(form) {
	if(verify == 'n') {
		return true;
	}

	if(verify == 'd') {
		return confirmaRemove();
	}

	for (var i = 0; i < form.elements.length; i++) {
		if ((form.elements[i].type == "text" || form.elements[i].type == "password") && form.elements[i].value == "") {
			alert("O campo "+ form.elements[i].id +" deve ser preenchido");
			form.elements[i].focus();
			return false;
		}
	}
	return true;
}

function confirma() {
	if(confirm("Tem certeza que deseja continuar?")) {
		return true;
	}
	return false;
}

function confirmaCopia() {
	if(confirm("Esse commando irá gerar um novo registro com \n as mesmas informações do registro atual. Deseja continuar?")) {
		return true;
	}
	return false;
}

function confirmaRemove() {
	if(confirm("Tem certeza que deseja excluir esse registro?")) {
		return true;
	}
	return false;
}

function confirmaInfo() {
	if(confirm("Tem certeza que deseja enviar essa informação?")) {
		return true;
	}
	return false;
}

function showMsg() {
	var msg = document.getElementById('msg').getAttribute('title');

	if(msg != "" && msg != null) {
		alert(msg);
	}
}