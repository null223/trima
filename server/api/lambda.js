"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.handler = void 0;
const core_1 = require("@nestjs/core");
const platform_express_1 = require("@nestjs/platform-express");
const serverless_express_1 = require("@vendia/serverless-express");
const express_1 = require("express");
const app_module_1 = require("./app.module");
let cachedServer;
async function bootstrap() {
    if (!cachedServer) {
        const expressApp = (0, express_1.default)();
        const nestApp = await core_1.NestFactory.create(app_module_1.AppModule, new platform_express_1.ExpressAdapter(expressApp));
        nestApp.enableCors();
        await nestApp.init();
        cachedServer = (0, serverless_express_1.default)({ app: expressApp });
    }
    return cachedServer;
}
const handler = async (event, context, callback) => {
    const server = await bootstrap();
    return server(event, context, callback);
};
exports.handler = handler;
exports.default = exports.handler;
//# sourceMappingURL=lambda.js.map