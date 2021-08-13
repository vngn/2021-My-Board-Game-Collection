<?php

namespace App\Controller;

use App\Entity\Jeu;
use App\Repository\jeuRepository;
use App\Service\GeneratePDFService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PdfController extends AbstractController
{
    /**
     * @Route("/pdf/{id}/index", name="generate_pdf")
     */
    public function download(Request $request,Jeu $jeu,GeneratePDFService $pdf): Response
    {
        // convertir image en Base64
        $img_path = 'http://myboardgamecollection.fr/uploads/' . $jeu->getImage();

        $extencion = pathinfo($img_path, PATHINFO_EXTENSION);
        $data = file_get_contents($img_path, false);
        $img_base_64 = base64_encode($data);
        $path_img = 'data:image/' . $extencion . ';base64,' . $img_base_64;
        $jeu->setImage($path_img);

        $nompdf = $jeu->getNom();
        
        return $pdf->renderPDF(
            "pdf/index.html.twig",
            ['jeu' => $jeu],
            "$nompdf"
        );
    }
}