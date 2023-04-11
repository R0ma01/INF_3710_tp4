import { Component } from '@angular/core';
import { Membre } from "../../../../common/tables/Membre";
@Component({
  selector: 'app-membre',
  templateUrl: './membre.component.html',
  styleUrls: ['./membre.component.css']
})
export class MembreComponent {
  public membres: Membre[]=[];




}
