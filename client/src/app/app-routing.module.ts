import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";

import { AppComponent } from "./app.component";
import { MembreComponent } from "./membre/membre.component";
import { ReservationComponent } from "./reservation/reservation.component";

const routes: Routes = [
  { path: "app", component: AppComponent },
  { path: "membres", component: MembreComponent },
  { path: "reservation", component: ReservationComponent },
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule { }