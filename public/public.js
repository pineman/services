const http = require('http');
const fs = require('fs');
const path = require('path');
const child_process = require('child_process');

process.chdir('/public');
http.createServer((req, res) => {
	let ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress;
	let dir = path.basename(decodeURI(req.url));
	const log = (msg) => {
		console.log(`[${ip} ${dir}] ${msg}`);
	};
	log('request');
	let stat = fs.statSync(dir, {throwIfNoEntry: false})
	if (stat === undefined || !stat.isDirectory()) {
		log('not a dir');
		res.writeHead(404);
		res.end();
		return;
	}
	let zip = child_process.spawn('zip', ['-0', '-r', '-', dir]);
	zip.on('error', (err) => {
		log(`failed to start zip: ${err}`);
	});
	zip.stderr.on('data', (stderr) => {
		log(`stderr: ${stderr}`);
	});
	zip.on('close', (code) => {
		log(`exit: ${code} ${code == 0 ? 'success' : ''}`);
	});
	req.on('close', () => {
		zip.kill();
		log('req close');
	});
	res.writeHead(200, {'Content-Type': 'application/zip'});
	log('piping zip');
	zip.stdout.pipe(res);
}).listen(8035);

