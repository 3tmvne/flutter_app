import { EvaluationsService } from './evaluations.service';
export declare class EvaluationsController {
    private readonly evaluationsService;
    constructor(evaluationsService: EvaluationsService);
    findAll(): {
        message: string;
    };
}
