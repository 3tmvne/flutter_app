import { CentersService } from './centers.service';
export declare class CentersController {
    private readonly centersService;
    constructor(centersService: CentersService);
    findAll(): {
        message: string;
    };
}
