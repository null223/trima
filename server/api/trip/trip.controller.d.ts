import { TripService } from './trip.service';
import { CreateTripDto } from './dto/create-trip.dto';
import { UpdateTripDto } from './dto/update-trip.dto';
import { Trip } from '@prisma/client';
export declare class TripController {
    private readonly tripService;
    constructor(tripService: TripService);
    create(createTripDto: CreateTripDto): Promise<Trip>;
    findAll(): Promise<Trip[]>;
    findOne(id: string): Promise<Trip>;
    update(id: string, updateTripDto: UpdateTripDto): Promise<Trip>;
    remove(id: string): Promise<Trip>;
}
