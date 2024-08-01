WebAssembly.instantiateStreaming(fetch("module.wasm"), {
	env: {}
}).then((wasm) => {
	console.log(`Wasm module lodded ${wasm}`);
	const resultDiv = document.getElementById("result");
	const result = wasm.instance.exports.sum(1, 2);
	resultDiv.textContent = `Result is: ${result}`;
})
