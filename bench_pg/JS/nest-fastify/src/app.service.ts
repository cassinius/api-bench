import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return JSON.stringify({
      status: 'OK',
      msg: 'Hello World!',
    });
  }
}
