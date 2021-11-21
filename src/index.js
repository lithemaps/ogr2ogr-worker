const { spawn } = require('child_process');

const child = spawn('gdalinfo', ['--version']);

child.stdout.on('data', (data) => {
    console.log(`stdout: ${data}`);
});

child.stderr.on('data', (data) => {
    console.error(`stderr: ${data}`);
});

child.on('exit', (code, signal) => {
    console.log(`process exited with code ${code} and signal ${signal}`);
});